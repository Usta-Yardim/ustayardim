import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';
import 'package:http/http.dart' as http;

class AdressHelper extends ChangeNotifier{

  List<IlModel> iller = [];
  List<IlceModel> ilceler = [];
  
  AdressHelper(){
    _getIller();
    iller.add(IlModel(id: 6, name: "Ankara"));
    ilceler.add(IlceModel(id: 1022, ilId: 6, name: "Yenimahalle"));
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

      ilceler = newList;

      notifyListeners();

    }else{
      print(response.statusCode);
      print(response.body);
    }
  }


}