import 'package:chat_clone/constants.dart';
import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0.0),
          fixedSize: MaterialStateProperty.all(kSize),
        ),
        onPressed: onPress,
        child: Text(
          title,
          style: kTextStyle2,
        ),
      ),
    );
  }
}
