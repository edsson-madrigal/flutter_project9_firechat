// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project9_firechat/screens/welcome_screen.dart';
import 'package:flutter_project9_firechat/screens/login_screen.dart';
import 'package:flutter_project9_firechat/screens/registration_screen.dart';
import 'package:flutter_project9_firechat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
          button: TextStyle(color: Colors.black54),
          caption: TextStyle(color: Colors.black54),
          subtitle1: TextStyle(color: Colors.black54),
          headline1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
