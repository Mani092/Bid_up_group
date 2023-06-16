import 'package:bidup/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

    @override
    State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: AnimatedSplashScreen(
                  duration: 3000,
                  splash: Image.asset("Assets/images/splash_screen_image.png",
                  ),
                  nextScreen: LoginPage(),
                  splashTransition: SplashTransition.fadeTransition,
                  backgroundColor: Colors.blue,
        ),
    );
}
}