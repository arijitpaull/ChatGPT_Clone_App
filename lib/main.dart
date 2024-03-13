import 'package:chatgpt/providers/models_provider.dart';
import 'package:chatgpt/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt/consts/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> ModelsProvider()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Style.style(isDark,context),
        home: ChatScreen(isDark: isDark,),
      ),
    );
  }
}