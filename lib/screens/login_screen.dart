import 'package:chat_clone/Widget/button_elevated.dart';
import 'package:chat_clone/Widget/input_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String loginScreen = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool showSpinner = false;
  void spinner(value) {
    if (mounted) {
      setState(() {
        showSpinner = value;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    spinner(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: showSpinner,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: 120,
                    width: 160,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputForm(
                      keyboardInputType: TextInputType.emailAddress,
                      hintText: 'Enter your email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else {
                          email = value;
                        }
                      },
                    ),
                    InputForm(
                      obscureValue: true,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else {
                          password = value;
                        }
                      },
                    ),
                  ],
                ),
              ),
              ButtonElevated(
                title: 'Login',
                onPress: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      spinner(true);
                      await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          ChatScreen.chatScreen,
                          (Route<dynamic> route) => false);
                    } on FirebaseAuthException catch (e) {
                      spinner(false);
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
