import 'package:chat_ease/Screens/LoginScreen.dart';
import 'package:chat_ease/Screens/OnBoardingScreen.dart';
import 'package:chat_ease/Screens/RegisterScreen.dart';
import 'package:chat_ease/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/chatScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatEase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "RobotoMono",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.ScreenRoute,
      routes: {
        SplashScreen.ScreenRoute: (context) => SplashScreen(),
        OnBoardingScreen.ScreenRoute: (context) => OnBoardingScreen(),
        LoginScreen.ScreenRoute: (context) => LoginScreen(),
        RegisterScreen.ScreenRoute: (context) => RegisterScreen(),
        ChatScreen.ScreenRoute: (context) => ChatScreen(),
      },
    );
  }
}

