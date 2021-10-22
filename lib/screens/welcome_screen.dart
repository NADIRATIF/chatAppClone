import 'package:chat_clone/Widget/button_elevated.dart';
import 'package:chat_clone/constants.dart';
import 'package:chat_clone/screens/login_screen.dart';
import 'package:chat_clone/screens/registration_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String welcomeScreen = '/welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: kDuration,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {
        controller.value;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    child: Image.asset('images/logo.png'),
                    height: controller.value * 60,
                    width: 80,
                  ),
                ),
                const Text(
                  'Chat App',
                  style: kTextStyle1,
                ),
              ],
            ),
            ButtonElevated(
              title: 'Login',
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.loginScreen);
              },
            ),
            ButtonElevated(
              title: 'Register',
              onPress: () {
                Navigator.pushNamed(context, RegisterScreen.registerScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
