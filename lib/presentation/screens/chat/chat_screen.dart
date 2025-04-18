import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];

                return (message.fromWho == FromWho.HER)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
            ),
          ),
          // Chat box
          MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value)),
        ],
      ),
    );
  }
}
