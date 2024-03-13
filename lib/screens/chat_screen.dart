//import 'package:chatgpt/style.dart';
import 'package:chatgpt/consts/constants.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/services/services.dart';
import 'package:chatgpt/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  final bool isDark;
  const ChatScreen({super.key, required this.isDark});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _chatStart = true;
  bool _isTyping = true;
  late TextEditingController textEditingController;
  bool isTextNotEmpty = false;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: const Text('ChatGPT'),
        leading: IconButton(
          onPressed: ()async{
            await Services.showModalSheet(context: context, isDark: widget.isDark);
          }, 
          icon: const Icon(Icons.sort),
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      body: SafeArea(
        child: Column(
            children: [
              Flexible(
                child: _chatStart ?ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index){
                    return ChatWidget(
                      msg: chatMessages[index]['msg'].toString(),
                      chatIndex: int.parse(chatMessages[index]["chatIndex"].toString()),
                    );
                  }
                ): Center(
                  child: Image.asset('assets/images/openai_logo.png',width: 60,height: 60,),
                ),
              ),
              if(_isTyping)...[
                SpinKitDoubleBounce(
                  color: widget.isDark?Colors.white:Colors.black,
                  size: 25,
                )
              ],
              Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                            Expanded(
                            child: TextField(
                              controller: textEditingController,
                              onSubmitted: (value){
                              },
                              onChanged: (value){
                                setState(() {
                                  isTextNotEmpty = value.isNotEmpty;
                                });
                              },
                              decoration: const InputDecoration.collapsed(hintText: 'Message',),
                            ),
                          ),
                          Transform.rotate(
                            angle: 4.7,
                            child: IconButton(
                              onPressed: ()async{
                                try {
                                await ApiServices.getModels();
                                } catch(e){
                                  print('error: $e');
                                }
                              }, 
                              icon: Opacity(
                                opacity: isTextNotEmpty ? 1 : 0, 
                                child: const Icon(Icons.arrow_circle_right)),
                              iconSize: 30,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
      )
    );
  }
}