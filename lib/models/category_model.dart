import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/global/global.dart';

import 'repairman_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final String photoUrl;

  CategoryModel({required this.id, required this.name, required this.photoUrl}) {
    precacheImage(Image.network(photoUrl).image, getContext());
  }

  factory CategoryModel.fromJson({required dynamic json}) {
    return CategoryModel(
      id: json["id"],
      name: json["kategoriName"],
      photoUrl: json["kategoriUrl"],
    );
  }
}
