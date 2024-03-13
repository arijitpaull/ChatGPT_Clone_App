import 'package:chatgpt/models/models_model.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/material.dart';

class ModelsProvider with ChangeNotifier{


  String currentModel = "gpt-3.5-turbo-16k-0613";
  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel){
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelList = [];

  List<ModelsModel> get getModelsList {
    return modelList;
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelList = await ApiServices.getModels();
    return modelList;
  }

}