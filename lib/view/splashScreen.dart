import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'homePage/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    _delay() {
    Future.delayed(
      const Duration(milliseconds: 5000),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delay();
  }



  @override
  Widget build(BuildContext context) {
    return /* Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff131730),
            Color(0xff3b296b),
            Color(0xff3b296b),
            Color(0xff131730),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child:  ,
    ); */
        Scaffold(
            body: Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset('assets/anims/splash.json',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            frameRate: FrameRate(120),
            repeat: false),
        FittedBox(
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            totalRepeatCount: 0,
            animatedTexts: [
              TypewriterAnimatedText(
                'Accurate Weather App',
                textStyle: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
