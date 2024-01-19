import 'package:ustayardim/models/il_model.dart';
import 'package:ustayardim/models/ilce_model.dart';
import 'package:ustayardim/models/mahalle_model.dart';

class RepairmanModel {
  final int id;
  final String name;
  final double? rate;
  final String phoneNumber;
  final IlModel? ilModel;
  final IlceModel? ilceModel;
  final MahalleModel? mahalleModel;
  final String? aboutMe;
  final String? photoUrl;
  final List<String> referanceImages;

  RepairmanModel(
      {required this.id,
      required this.name,
      required this.rate,
      required this.phoneNumber,
      required this.photoUrl,
      required this.aboutMe,
      required this.ilModel,
      required this.ilceModel,
      required this.mahalleModel,
      required this.referanceImages});

  factory RepairmanModel.fromJson({required dynamic json}) {
    return RepairmanModel(
        id: json["userId"],
        name: json["user"]["fullName"],
        rate: double.parse(json["puan"].toString()),
        phoneNumber: json["user"]["phoneNumber"],
        photoUrl: json["profilImgPath"],
        aboutMe: json["hakkinda"],
        referanceImages: (json["referansImgPath"] as List<dynamic>).map((e) => e.toString()).toList(),
        ilModel: json["ilinfo"] == null ? null : IlModel.fromJson(json: json["ilinfo"]),
        ilceModel: json["ilceinfo"] == null ? null : IlceModel.fromJson(json: json["ilceinfo"]),
        mahalleModel:
            json["mahalleinfo"] == null ? null : MahalleModel.fromJson(json: json["mahalleinfo"]));
  }
}
