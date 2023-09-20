import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_chat/screens/Auth/login_screen.dart';
import 'package:lets_chat/screens/home_screen.dart';
import 'package:lets_chat/screens/intro_screen.dart';
import '../../main.dart';
import '../api/apis.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 43, 52, 103),
        systemNavigationBarColor: Color.fromARGB(255, 43, 52, 103),
      ));

      if (APIs.auth.currentUser != null) {
        print('User: ${FirebaseAuth.instance.currentUser}');

        // Navigator to Home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        // Navigator to Splash screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const IntroScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
        // App BAr

        // Body
        body: Stack(
      children: [
        // Introduction of app
        Positioned(
            top: mq.height * .6,
            left: mq.width * .3,
            width: mq.width * .9,
            height: mq.height * 0.7,
            child: Text(
              'Talkit',
              style: TextStyle(
                color: Color.fromARGB(255, 1, 28, 50),
                fontSize: 50,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
              ),
            )),

        // App logo
        Positioned(
            top: mq.height * .3,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('images/logo.png')),
      ],
    ));
  }
}
