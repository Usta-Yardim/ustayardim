class IlceModel {
  final int id;
  final int ilId;
  final String name;

  IlceModel({required this.id, required this.ilId, required this.name});

  static IlceModel fromJson({required dynamic json}) {
    return IlceModel(id: json["ilceId"], ilId: json["ilId"], name: json["ilceAdi"]);
  }
}
