import 'package:chatgpt/providers/models_provider.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? currentModel;
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelsProvider>(context,listen: false);
    currentModel = modelProvider.getCurrentModel;
    return FutureBuilder(
      future: modelProvider.getAllModels(), 
      builder: (context, snapshot){
        if(snapshot.hasError){
          String errorMsg = snapshot.error.toString();
          return Text(errorMsg);
        } 
        return snapshot.data == null || snapshot.data!.isEmpty 
        ? const SizedBox.shrink()
        : FittedBox(
          child: DropdownButton(
            items: List<DropdownMenuItem<String>>.generate(
            snapshot.data!.length, 
            (index) => DropdownMenuItem(
              value: snapshot.data![index].id,
              child: Text(snapshot.data![index].id,
                style: const TextStyle(
                fontSize: 16),
            ))),
            value: currentModel,
            onChanged: (value){
                setState(() {
                currentModel = value.toString();
              });
              modelProvider.setCurrentModel(value.toString());
            }
          ),
        );
      }
    );
  }
}