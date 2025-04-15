import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hermana"),

        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://d1rig8ldkblbsy.cloudfront.net/app/uploads/2020/09/17114711/jennifer-aniston-256x256.jpg',
            ),
          ),
        ),
      ),

      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? HerMessageBubble()
                    : MyMessageBubble();
              },
              itemCount: 100,
            ),
          ),
          // Chat box
          MessageFieldBox()
        ],
      ),
    );
  }
}



