import 'package:chat_ease/Screens/LoginScreen.dart';
import 'package:chat_ease/Screens/OnBoardingScreen.dart';
import 'package:chat_ease/Screens/RegisterScreen.dart';
import 'package:chat_ease/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/chatScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        SplashScreen.ScreenRoute: (context) => const SplashScreen(),
        OnBoardingScreen.ScreenRoute: (context) => const OnBoardingScreen(),
        LoginScreen.ScreenRoute: (context) => const LoginScreen(),
        RegisterScreen.ScreenRoute: (context) => const RegisterScreen(),
        ChatScreen.ScreenRoute: (context) => const ChatScreen(),
      },
    );
  }
}

