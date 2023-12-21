import 'package:chat_ease/Componenets/Components.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: const AssetImage("assets/images/onBoardingBG.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(.97), BlendMode.screen)),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110.0, left: 30.0),
              child: txt("Sign In", Colors.white, 30.0, FontWeight.bold),
            ),
            const SizedBox(height: 80.0,),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(30.0),
                        topRight:Radius.circular(30.0))),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),

      );

  }
}

