import 'package:chat_ease/Componenets/Components.dart';
import 'package:chat_ease/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/onBoardingBG.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.screen)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 117.0 ,left: 15.0,right: 15.0),
            child: Column(
              children: [
                txt("ChatEase", Colors.grey.shade300, 35.0, FontWeight.bold),
                const SizedBox(
                  height: 41.0,
                ),
                SvgPicture.asset("assets/images/onBoarding.svg",
                  width: 280,
                  height: 225.0,
                  
                ),
                const SizedBox(
                  height: 40.0,
                ),

                txt("Stay connected with your friends and family",
                    Colors.white, 
                    35.0,
                    FontWeight.w700,
                    height: 1.3
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/check.svg",
                      width: 24.0,
                      height: 24.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    txt("Secure, private messaging", Colors.white, 16.0, FontWeight.w500),
                  ],
                ),
                const SizedBox(
                  height: 60.0,
                ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 64,
                //   child: MaterialButton(
                //     color: Colors.white,
                //     shape: const StadiumBorder(),
                //     onPressed: (){
                //       Navigator.of(context).pushReplacement(
                //         MaterialPageRoute(builder: (c) {
                //         return LoginScreen();
                //       }),);
                //     },
                //     child: txt("Get Started", Colors.black, 16.0, FontWeight.bold),
                //   ),
                // ),
                button(
                    double.infinity,
                    64,
                    Colors.white,
                    () { Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder: (c) {
                         return LoginScreen();
                  }),);},
                    "Get Started",
                  Colors.black

                ),

              ],
            ),
          ),
        ),
        )

    );
  }
}
