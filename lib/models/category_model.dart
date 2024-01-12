import 'dart:core';

import 'package:ustayardim/api/api.dart';

import 'repairman_model.dart';

class CategoryModel{
  final String id;
  final String name;
  final String photoUrl;
  List<RepairmanModel> repairmans = [];

  CategoryModel({required this.id, required this.name, required this.photoUrl}){
    _getRepairmans();
  }

  _getRepairmans()async {
    repairmans =await Api.getUstalar();
  }

}