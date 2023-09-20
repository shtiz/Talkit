import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_chat/screens/Auth/login_screen.dart';
import 'package:lets_chat/screens/home_screen.dart';
import '../../main.dart';
import '../api/apis.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
        // App BAr
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 43, 52, 103),
          automaticallyImplyLeading: true,
          title: Text(
            'Talkit',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 30, color: Colors.white),
          ),
        ),

        // Body
        body: Stack(
          children: [
            // Introduction of app
            Positioned(
              top: mq.height * .5,
              left: mq.width * .1,
              width: mq.width * .9,
              height: mq.height * 0.7,
              child: SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 25.0, color: Colors.black),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Connect with the world ',
                          speed: Duration(
                            milliseconds: 30,
                          ))
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),

            // App logo
            Positioned(
              top: mq.height * .2,
              right: mq.width * .25,
              width: mq.width * .5,
              child: Image.asset('images/logo.png'),
            ),

            Positioned(
              top: mq.height * .7,
              left: mq.width * .25,
              child: ElevatedButton(
                style: const ButtonStyle(
                    enableFeedback: true,
                    fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(170),
                    ),
                    elevation: MaterialStatePropertyAll(2),
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 43, 52, 103))),
                onPressed: () {
                  // Navigator to Home screen
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                child: Text(
                  'Get started',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 15),
                ),
              ),
            )
          ],
        ));
  }
}




/*class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10000), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      ));

      if (APIs.auth.currentUser != null) {
        print('User: ${FirebaseAuth.instance.currentUser}');

        // Navigator to Home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        // Navigator to login screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }*/
