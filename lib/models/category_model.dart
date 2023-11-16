import 'dart:core';

import 'repairman_model.dart';

class CategoryModel{
  final String id;
  final String name;
  final String photoUrl;
  List<RepairmanModel> repairmans = [];

  CategoryModel({required this.id, required this.name, required this.photoUrl}){
    _getRepairmans();
  }

  _getRepairmans(){
    repairmans = [
      RepairmanModel(id: "fdasdasddsada", name: "Ahmet", rate: 4.5, phoneNumber:"05368564376"),
      RepairmanModel(id: "fdasdsadasdad", name: "Berke", rate: 3.6, phoneNumber:"05436759873"),
      RepairmanModel(id: "f321fdsadsada", name: "Davut", rate: 4.1, phoneNumber:"05517653474")
    ];
  }

}