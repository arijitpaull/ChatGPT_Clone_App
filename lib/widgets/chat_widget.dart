import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});
  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              chatIndex == 0 ? Image.asset('assets/images/user_logo.png',height: 30,width: 30,) : Image.asset('assets/images/openai_logo.png',height: 30,width: 30,),
              const SizedBox(width: 10,),
              Expanded(child: Text(msg, style: const TextStyle(fontSize: 16,),)),
            ],
          ),
        )
      ],
    );
  }
}