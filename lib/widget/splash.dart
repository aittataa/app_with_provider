import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/screens/initial_screen.dart';
import 'package:wallet_manager/widget/bounce_point.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: const InitialScreen(),
      splash: const BouncePoint(),
      curve: curve,
      backgroundColor: whiteBackColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: duration,
      splashIconSize: double.infinity,
    );
  }
}
