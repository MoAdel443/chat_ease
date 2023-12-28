import 'package:chat_ease/Components/Components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  static const String ScreenRoute = "chat_screen";
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

final _fireStore = FirebaseFirestore.instance;
late User signedInUser;

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getMessage () async{
  //   final messages = await _fireStore.collection("messages").get();
  //
  //   for(var msg in messages.docs){
  //     print(msg.data().values.last);
  //   }
  // }
  void messageStreams() async {
    await for (var snapshot in _fireStore.collection("messages").snapshots()) {
      for (var msg in snapshot.docs) {
        print(msg.data().values.last);
      }
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
              messageStreams();
              // _auth.signOut();
              // Navigator.pop(context);
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
            const messageBulder(),
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
                      padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                      child: TextField(
                        controller: messageController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: InputBorder.none,
                            hintText: "Message"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
                    child: TextButton(
                      onPressed: () {
                        if (messageController.text != "") {
                          _fireStore.collection("messages").add({
                            "text": messageController.text,
                            "sender": signedInUser.email,
                          });
                        }
                        messageController.text = "";
                      },
                      child: const Text("Send"),
                    ),
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
class messageBulder extends StatelessWidget {
  const messageBulder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection("messages").snapshots(),
      builder: (context, snapshot) {
        List<messageShape> messageWidgets = [];

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }

        final messages = snapshot.data!.docs;
        for (var msg in messages) {
          final messageText = msg.get("text");
          final messageSender = msg.get("sender");
          final currentUser = signedInUser.email;
          final messageWidget = messageShape(
            msg: messageText,
            sender: messageSender,
            isMe : messageSender == currentUser,
          );
          messageWidgets.add(messageWidget);
        }

        return Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: 20.0),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}


class messageShape extends StatelessWidget {
  const messageShape({required this.isMe,this.msg, this.sender, super.key});
  final String? msg;
  final String? sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMe? CrossAxisAlignment.end :CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 3) ,
          child: Text(
            "$sender",
            style: const TextStyle(color: Colors.black45, fontSize: 10.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Material(
            color: isMe? Colors.black87 : Colors.black26,
            borderRadius: isMe ? const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),

            ) :
            const BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),

            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$msg",
                style: const TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
