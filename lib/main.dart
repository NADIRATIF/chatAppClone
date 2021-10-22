import 'package:chat_clone/screens/chat_screen.dart';
import 'package:chat_clone/screens/login_screen.dart';
import 'package:chat_clone/screens/registration_screen.dart';
import 'package:chat_clone/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat Demo',
      theme: ThemeData.light(),
      initialRoute: WelcomeScreen.welcomeScreen,
      routes: {
        WelcomeScreen.welcomeScreen: (context) => const WelcomeScreen(),
        LoginScreen.loginScreen: (context) => const LoginScreen(),
        RegisterScreen.registerScreen: (context) => const RegisterScreen(),
        ChatScreen.chatScreen: (context) => const ChatScreen(),
      },
    );
  }
}
