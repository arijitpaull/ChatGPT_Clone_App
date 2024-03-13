import 'dart:convert';
import 'dart:io';

import 'dart:developer';

import 'package:chatgpt/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  static Future<List<ModelsModel>> getModels()async{
    try{
      var res = await http.get(
        Uri.parse('https://api.openai.com/v1/models'),
        headers: {'Authorization': 'Bearer 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'},
      ); 
      Map jsonRes = jsonDecode(res.body);

      if(jsonRes['error']!=null){
        throw HttpException(jsonRes['error']["message"]);
      }

      List temp = [];
   
      for(var value in jsonRes["data"]){
        temp.add(value);
        log('temp ${value["id"]}');
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch(e){
      log("error: $e");
      rethrow;
    }
  }
}
