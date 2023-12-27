import 'package:chat_ease/Components/Components.dart';
import 'package:chat_ease/Screens/chatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  static const String ScreenRoute = "register_screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isShowing = true;
  bool isPressed = false;
  IconData? icon;

  final _auth = FirebaseAuth.instance;

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
              child: txt("Register", Colors.white, 30.0, FontWeight.bold),
            ),
            const SizedBox(
              height: 80.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/onBoardingBG.png"),
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
                          InkWell(
                            onTap: () {},
                            child: const Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundColor:
                                    Color.fromRGBO(239, 241, 243, 1),
                                child: Icon(Icons.camera_alt),
                              ),
                            ),
                          ),
                          txt("Name", Colors.black, 18.0, FontWeight.bold),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Name Can't be Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            controller: nameController,
                            decoration: const InputDecoration(
                              label: Text("Your Name, e.g : John Doe"),
                            ),
                          ),
                          const SizedBox(
                            height: 36.0,
                          ),
                          txt("Email", Colors.black, 18.0, FontWeight.bold),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email Can't be Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                              label: Text("Your email"),
                            ),
                          ),
                          const SizedBox(
                            height: 36.0,
                          ),
                          txt("Phone", Colors.black, 18.0, FontWeight.bold),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone Can't be Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            decoration: const InputDecoration(
                              label: Text("Your phone number"),
                            ),
                          ),
                          const SizedBox(
                            height: 36.0,
                          ),
                          txt("Password", Colors.black, 18.0, FontWeight.bold),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Can't be Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                                label: const Text("Enter Your Password"),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      isShowing = !isShowing;
                                      if (isShowing == false) {
                                        setState(() {
                                          icon = Icons.visibility;
                                        });
                                      } else {
                                        setState(() {
                                          icon = Icons.visibility_off;
                                        });
                                      }
                                    },
                                    icon: Icon(icon))),
                            obscureText: isShowing ? true : false,
                          ),
                          const SizedBox(
                            height: 36.0,
                          ),
                          txt("Confirm Password", Colors.black, 18.0,
                              FontWeight.bold),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password Can't be Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                                label: const Text("Enter Your Password"),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      isShowing = !isShowing;
                                      if (isShowing == false) {
                                        setState(() {
                                          icon = Icons.visibility;
                                        });
                                      } else {
                                        setState(() {
                                          icon = Icons.visibility_off;
                                        });
                                      }
                                    },
                                    icon: Icon(icon))),
                            obscureText: isShowing ? true : false,
                          ),
                          const SizedBox(
                            height: 56.0,
                          ),
                          isPressed
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                              : button(double.infinity, 64, Colors.black,
                                  () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    setState(() {
                                      isPressed = true;
                                    });
                                  }
                                  try {
                                    final newUser = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                    Navigator.pushNamed(
                                        context, ChatScreen.ScreenRoute);
                                  } catch (e) {
                                    print(e);
                                  }
                                }, "Register", Colors.white),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 90.0,
                                height: 1.0,
                                color: Colors.grey[600],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: txt("Or Register With", Colors.black26,
                                    14.0, FontWeight.w600),
                              ),
                              Container(
                                width: 90.0,
                                height: 1.0,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  //todo do registration with facebook
                                },
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    "assets/images/facebook.svg",
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 21.0,
                              ),
                              InkWell(
                                onTap: () {
                                  //todo do registration with gmail
                                },
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.white,
                                  child: SvgPicture.asset(
                                    "assets/images/gmail.svg",
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                ),
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
