import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';
import 'package:http/http.dart' as http;
import 'package:ustayardim/models/mahalle_model.dart';

class AdressHelper extends ChangeNotifier{

  List<IlModel> iller = [];
  List<IlceModel> ilceler = [];
  List<MahalleModel> mahalleler = [];
  
  AdressHelper(){
    _getIller();
    notifyListeners();
  }
  
  _getIller() async {
    
    final response = await http.get(Uri.parse("http://localhost:5120/api/Adress/Iller"));

    if (response.statusCode == 200){

      var jsonBody = jsonDecode(response.body);
      List<IlModel> newList = [];
      for(var json in jsonBody){
        newList.add(IlModel.fromJson(json: json));
      }

      ilceler = [];

      mahalleler = [];

      iller = newList;

      notifyListeners();

    }else{
      print(response.statusCode);
      print(response.body);
    }
    
  }

  getIlceler({required int ilId}) async {

    final response = await http.get(Uri.parse("http://localhost:5120/api/Adress/Ilceler/${ilId}"));

    if (response.statusCode == 200){

      var jsonBody = jsonDecode(response.body);
      List<IlceModel> newList = [];
      for(var json in jsonBody){
        newList.add(IlceModel.fromJson(json: json));
      }

      mahalleler = [];

      ilceler = newList;

      notifyListeners();

    }else{
      print(response.statusCode);
      print(response.body);
    }
  }

  getMahalleler({required int ilceId}) async{
    final response = await http.get(Uri.parse("http://localhost:5120/api/Adress/Mahalleler/${ilceId}"));

    if (response.statusCode == 200){

      var jsonBody = jsonDecode(response.body);
      List<MahalleModel> newList = [];
      for(var json in jsonBody){
        newList.add(MahalleModel.fromJson(json: json));
      }

      mahalleler = newList;

      notifyListeners();

    }else{
      print(response.statusCode);
      print(response.body);
    }
  }


}