import 'package:chat_ease/Components/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          children: [
            SvgPicture.asset("assets/images/logo.svg",width: 25.0,height: 25.0,color: Colors.white,),
            SizedBox(width: 10.0,),
            txt("ChatEase", Colors.white, 18.0, FontWeight.w700)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.close) ,color: Colors.white,)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(),
            Container(
              width: double.infinity,
              height: 40.0,
              child: TextField(
                decoration: InputDecoration(label: Text("Message")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
