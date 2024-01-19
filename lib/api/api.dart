import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/helpers/date_helper.dart';
import 'package:ustayardim/helpers/navigator_helper.dart';
import 'package:ustayardim/helpers/snack_bar_helper.dart';
import 'package:ustayardim/helpers/user_helper.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';
import 'package:ustayardim/models/mahalle_model.dart';
import 'package:ustayardim/models/repairman_model.dart';
import 'package:ustayardim/models/user_model.dart';
import 'package:ustayardim/screens/main_page.dart';

class Api {
  static login(
      {required String mail, required String password, required UserType loginUserType}) async {
    final response = await http.post(Uri.parse("http://localhost:5120/api/Users/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": mail,
          "password": password,
          "userType": loginUserType == UserType.CLIENT ? "musteri" : "usta",
          //"rememberMe": true
        }));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      print(json);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString("token", json["token"]);
      prefs.setInt("userId", json["userId"]);
      prefs.setString("userType", loginUserType.name);

      token = json["token"];
      userId = json["userId"];
      userType = loginUserType;

      NavigatorHelper.pushAndRemoveUntil(destination: MainPage());

      print("ok");
      print(json["token"]);
    } else {
      var json = jsonDecode(response.body);

      if (json["message"] != null) {
        SnackBarHelper.showSnackBar(content: json["message"], type: SnackBarType.WARNING);
      }

      print(response.body);
      print(response.statusCode);
    }
  }

  static register(
      {required String name,
      required String mail,
      required String phone,
      required UserType userType,
      required String password}) async {
    final response = await http.post(Uri.parse("http://localhost:5120/api/Users/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "fullName": name,
          "email": mail,
          "phoneNumber": phone,
          "userType": userType == UserType.CLIENT ? "musteri" : "usta",
          "password": password,
        }));

    if (response.statusCode == 201) {
      SnackBarHelper.showSnackBar(content: "Kayıt başarılı!", type: SnackBarType.SUCCESS);
      NavigatorHelper.pop();
    } else {
      var json = jsonDecode(response.body);

      if (json["message"] != null) {
        SnackBarHelper.showSnackBar(content: json["message"], type: SnackBarType.WARNING);
      }
      print(response.body);
      print(response.statusCode);
    }
  }

  static Future<List<RepairmanModel>> getUstalar() async {
    final response = await http.get(Uri.parse("http://localhost:5120/api/Account/Ustalar"));

    List<RepairmanModel> newList = [];

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);

      for (var json in jsonBody) {
        newList.add(RepairmanModel.fromJson(json: json));
      }
    } else {
      var json = jsonDecode(response.body);

      if (json["message"] != null) {
        SnackBarHelper.showSnackBar(content: json["message"], type: SnackBarType.WARNING);
      }
      print(response.body);
    }

    return newList;
  }

  static Future<UserModel?> getUser() async {
    print("---------------");
    print(userId);
    final response = await http.get(Uri.parse(
        "http://localhost:5120/api/Account/${userType == UserType.CLIENT ? "Musteri" : "Ustalar"}/${userId}"));

    UserModel? userModel;

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);

      await Provider.of<CategoriesHelper>(getContext(),listen: false).getCategories();

      userModel = UserModel.fromJson(json: jsonBody);
    } else {
      print(response.body);
    }

    return userModel;
  }

  static Future<bool> update(
      {String? name,
      String? phoneNumber,
      String? email,
      String? aboutMe,
      DateTime? dateOfBirth,
      IlModel? ilModel,
      IlceModel? ilceModel,
      MahalleModel? mahalleModel,
      String? oldPassword,
      String? newPassword,
      CategoryModel? categoryModel,
      List<File> referanceImages = const [],
      File? profileImage,
      required ActivePane activePane}) async {
    String activePaneString;

    switch (activePane) {
      case ActivePane.GENERAL:
        activePaneString = "#account-general";
        break;
      case ActivePane.CHANGE_PASSWORD:
        activePaneString = "#account-change-password";
        break;
      case ActivePane.GALLERY:
        activePaneString = "#account-galeri";
        break;
      case ActivePane.INFO:
        activePaneString = "#account-info";
        break;
    }

    UserHelper userHelper = Provider.of<UserHelper>(getContext(), listen: false);

    List<String> referanceBase64 = [];

    if (referanceImages.isNotEmpty) {
      referanceImages.forEach((element) {
        referanceBase64.add(base64Encode(element.readAsBytesSync()));
      });
    }

    String? profileImagePath;

    if (profileImage != null) {
      profileImagePath = base64Encode(profileImage.readAsBytesSync());
    }

    final response = await http.put(
        Uri.parse(
            "http://localhost:5120/api/Account/${userHelper.userModel!.userType == UserType.CLIENT ? "MusteriUpdate/" : ""}${userId}"),
        headers: {
          "accept": "*/*",
          "Content-Type": "application/json",
          'authorization': 'Bearer ${token}',
        },
        body: json.encode({
          "userId": userId,
          "user": {
            "fullName": name ?? userHelper.userModel!.name,
            "userId": userId,
            "email": email ?? userHelper.userModel!.email,
            "phoneNumber": phoneNumber ?? userHelper.userModel!.phoneNumber,
            "userType": userHelper.userModel!.userType == UserType.CLIENT ? "musteri" : "usta"
          },
          "profilImgPath": profileImagePath,
          "ilinfo": ilModel?.toMap(),
          "ilceinfo": ilceModel?.toMap(),
          "mahalleinfo": mahalleModel?.toMap(),
          "puan": null,
          "hakkinda": aboutMe,
          "birthday":
              dateOfBirth == null ? null : DateHelper.formatApiToString(dateTime: dateOfBirth),
          "tamamlananIs": null,
          "kategoriId":categoryModel?.id,
          "kategoriName":categoryModel?.name,
          "referansImgPath": referanceBase64,
          "activeTabPane": activePaneString,
          "oldPassword": oldPassword,
          "newPassword": newPassword
        }));

    print(response.statusCode);

    if (response.statusCode == 200) {
      SnackBarHelper.showSnackBar(
          content: "Veriler başarıyla güncellendi!", type: SnackBarType.SUCCESS);
      Provider.of<UserHelper>(getContext(), listen: false).getUser();
      return true;
    } else {
      SnackBarHelper.showSnackBar(content: response.body, type: SnackBarType.WARNING);
      print(response.body);
      return false;
    }
  }

  static Future<List<RepairmanModel>> getCategoryRepairmans({required int id}) async {
    final response = await http.get(Uri.parse("http://localhost:5120/api/Kategoriler/${id}"));

    List<RepairmanModel> newList = [];

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);

      for (var json in jsonBody) {
        newList.add(RepairmanModel.fromJson(json: json));
      }
    } else {
      var json = jsonDecode(response.body);
      SnackBarHelper.showSnackBar(content: json["message"], type: SnackBarType.WARNING);
    }

    return newList;
  }

  static Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(Uri.parse("http://localhost:5120/api/Kategoriler"));

    List<CategoryModel> newList = [];

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);

      for (var json in jsonBody) {
        newList.add(CategoryModel.fromJson(json: json));
      }
    } else {
      var json = jsonDecode(response.body);
      SnackBarHelper.showSnackBar(content: json["message"], type: SnackBarType.WARNING);
    }

    return newList;
  }
}
