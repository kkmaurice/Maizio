import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
        navigateRoute: const HomePage(),
        duration: 5000,
        imageSize: 150,
        imageSrc: 'assets/maize.jpeg',
        text: 'Maize Disease Detector',
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 40.0,
        ),
        backgroundColor: Colors.green);
  }
}
