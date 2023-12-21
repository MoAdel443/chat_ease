import 'dart:async';

import 'package:chat_ease/Componenets/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (c) {
        return const OnBoardingScreen();
      }),
    );
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/onBoardingBG.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black87, BlendMode.screen)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 75,
                height: 75,
                // ignore: deprecated_member_use
                color: Colors.grey[300],
              ),
              const SizedBox(height: 15.0,),
              txt("ChatEase", Colors.grey.shade300, 35.0, FontWeight.bold),

            ],
          ),
        ),
      ),
    );
  }
}
