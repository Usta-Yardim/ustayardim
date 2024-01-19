import 'package:provider/provider.dart';
import 'package:ustayardim/enums/enums.dart';
import 'package:ustayardim/global/global.dart';
import 'package:ustayardim/helpers/categories_helper.dart';
import 'package:ustayardim/helpers/date_helper.dart';
import 'package:ustayardim/models/category_model.dart';
import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';
import 'package:ustayardim/models/mahalle_model.dart';

class UserModel {
  final int id;
  final String name;
  final String email;
  final UserType userType;
  final String phoneNumber;
  final String? profileImageUrl;
  final IlModel? ilModel;
  final IlceModel? ilceModel;
  final MahalleModel? mahalleModel;
  final String? aboutMe;
  final DateTime? birthTime;
  final CategoryModel? categoryModel;
  final List<String>? referanceImages;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.userType,
      required this.phoneNumber,
      required this.profileImageUrl,
      required this.ilModel,
      required this.ilceModel,
      required this.mahalleModel,
      required this.aboutMe,
      required this.categoryModel,
      required this.birthTime,
      required this.referanceImages});

  factory UserModel.fromJson({required dynamic json}) {
    CategoriesHelper categoriesHelper = Provider.of<CategoriesHelper>(getContext(),listen: false);

    return UserModel(
        id: json["userId"],
        name: json["user"]["fullName"],
        email: json["user"]["email"],
        userType: json["user"]["userType"] == "usta" ? UserType.MECHANIC : UserType.CLIENT,
        phoneNumber: json["user"]["phoneNumber"],
        profileImageUrl: json["profilImgPath"],
        ilModel: json["ilinfo"] == null ? null : IlModel.fromJson(json: json["ilinfo"]),
        ilceModel: json["ilceinfo"] == null ? null : IlceModel.fromJson(json: json["ilceinfo"]),
        mahalleModel:
            json["mahalleinfo"] == null ? null : MahalleModel.fromJson(json: json["mahalleinfo"]),
        aboutMe: json["hakkinda"],
        categoryModel: categoriesHelper.categories.firstWhere((element) => element.id == json["kategoriId"]),
        birthTime:
            json["birthday"] == null ? null : DateHelper.formatApiFormat(date: json["birthday"]),
        referanceImages: json["referansImgPath"]?.toString().split(","));
  }
}
