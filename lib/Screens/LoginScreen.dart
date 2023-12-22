import 'package:chat_ease/Componenets/Components.dart'
    show button, textFromField, txt;
import 'package:chat_ease/Screens/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  bool isShowing = false;
  IconData ? icon ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("assets/images/onBoardingBG.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.95), BlendMode.screen)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110.0, left: 30.0),
              child: txt("Sign In", Colors.white, 30.0, FontWeight.bold),
            ),
            const SizedBox(
              height: 80.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            const AssetImage("assets/images/onBoardingBG.png"),
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.white70, BlendMode.screen)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30.0,
                          ),
                          txt("Email", Colors.black, 18.0, FontWeight.bold),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty ) {
                                return "Email Can't be Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                                label: Text("Enter Your Email"),
                                ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          txt("Password", Colors.black, 18.0, FontWeight.bold),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty ) {
                                return "Password Can't be Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            decoration:  InputDecoration(
                              label: const Text("Enter Your Password"),
                              suffixIcon: IconButton(onPressed: () {
                                isShowing = !isShowing ;
                                if (isShowing == false){
                                  setState(() {
                                    icon = Icons.visibility ;
                                  });
                                }
                                else{
                                  setState(() {
                                    icon = Icons.visibility_off ;
                                  });
                                }

                              }, icon: Icon(icon))
                            ),
                            obscureText: isShowing ? true : false ,
                          ),

                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (b) {
                                  setState(() {
                                    if (rememberMe == true) {
                                      rememberMe = false;
                                    } else {
                                      rememberMe = true;
                                    }
                                  });
                                  //todo make shared pref to save user data
                                },
                                activeColor: Colors.black87,
                              ),
                              txt("Remember Me", Colors.grey.shade800, 12.0,
                                  FontWeight.normal),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: txt(
                                    "Forgot Password?",
                                    Colors.grey.shade800,
                                    12.0,
                                    FontWeight.normal),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          button(
                              double.infinity,
                              64,
                              Colors.black,
                              () {
                                if(_formKey.currentState!.validate()){
                                  _formKey.currentState!.save();
                                }
                                   //todo navigate to home screen
                              },
                              "Login",
                              Colors.white
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              txt("Don’t have an account yet?",
                                  Colors.grey.shade700, 13.0, FontWeight.normal),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return const RegisterScreen();
                                  }));
                                },
                                child: txt("Register", Colors.black, 13.0,
                                    FontWeight.w700),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                height: 1.0,
                                color: Colors.grey[600],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12.0),
                                child: txt("Or Login With", Colors.black26, 14.0,
                                    FontWeight.w600),
                              ),
                              Container(
                                width: 100.0,
                                height: 1.0,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height:30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset("assets/images/gmail.svg",width: 25.0,height: 25.0,),
                              ),
                              const SizedBox(width: 21.0,),
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset("assets/images/facebook.svg",width: 25.0,height: 25.0,),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
