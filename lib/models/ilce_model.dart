class IlceModel {
  final int id;
  final String name;

  IlceModel({required this.id, required this.name});

  static IlceModel fromJson({required dynamic json}) {
    return IlceModel(id: json["ilceId"], name: json["ilceAdi"]);
  }

  Map<String,Object> toMap(){
    return {
      "ilceId":id.toString(),
      "ilceAdi":name
    };
  }
}
