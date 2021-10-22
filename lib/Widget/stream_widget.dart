import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'messages_bubbles.dart';

class MessagesStream extends StatelessWidget {
  const MessagesStream({
    Key? key,
    required FirebaseFirestore firestore,
    required this.current,
  })  : _firestore = firestore,
        super(key: key);

  final FirebaseFirestore _firestore;
  final User current;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('messages').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Expanded(
          child: ListView(
            reverse: true,
            children:
                snapshot.data!.docs.reversed.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              final sender = data['sender'];
              return MessageBubble(
                data: data,
                isMe: sender == current.email,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
