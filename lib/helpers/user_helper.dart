import 'package:flutter/cupertino.dart';
import 'package:ustayardim/api/api.dart';
import 'package:ustayardim/models/user_model.dart';

class UserHelper extends ChangeNotifier{
  UserModel? userModel;

  getUser()async{
    userModel = await Api.getUser();
    notifyListeners();
  }
}