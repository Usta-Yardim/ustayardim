import 'package:flutter/cupertino.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/models/category_model.dart';

class CategoriesHelper extends ChangeNotifier{
  List<CategoryModel> categories = [];


  CategoriesHelper(){
    getCategories();
  }
  
  getCategories()async{
    categories = await Api.getCategories();
    notifyListeners();
  }

}