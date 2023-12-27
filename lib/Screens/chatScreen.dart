import 'package:chat_ease/Components/Components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  static const String ScreenRoute = "chat_screen";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _auth = FirebaseAuth.instance;
  late User signedInUser ;

  void getCurrentUser (){
    try{
      final user = _auth.currentUser;
      if(user != null){
        signedInUser = user ;
        print(signedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 25.0,
              height: 25.0,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10.0,
            ),
            txt("ChatEase", Colors.white, 18.0, FontWeight.w700)
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.black87.withOpacity(.4)))),
              width: double.infinity,
              height: 60.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0,left: 12.0),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            hintText: "Message"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0,right: 12.0),
                    child: TextButton(onPressed: () {}, child: const Text("Send")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
