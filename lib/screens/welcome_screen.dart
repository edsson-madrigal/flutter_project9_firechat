// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, prefer_const_constructors_in_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project9_firechat/components/rounded_button.dart';
import 'package:flutter_project9_firechat/screens/login_screen.dart';
import 'package:flutter_project9_firechat/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, // ticker
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //   print(status);
    // });
    controller.addListener(() {
      setState(() {});
      //print(animation.value);
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
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 87, 87, 87),
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        speed: Duration(milliseconds: 150),
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
