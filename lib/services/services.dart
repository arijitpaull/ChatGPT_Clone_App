import 'package:chatgpt/widgets/drop_down.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context, required bool isDark}) async{
    await showModalBottomSheet(
              backgroundColor: isDark?const Color.fromARGB(255, 20, 20, 20):const Color.fromARGB(255, 225, 225, 225),
              context: context, 
              builder: ((context) {
              return const Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text("Choose Model:",style: TextStyle(fontSize: 16),),
                    ),
                    Flexible(
                      flex: 2,
                      child: DropDownWidget(),
                    ),
                  ],
                )
              );
            })
          );
  }
}