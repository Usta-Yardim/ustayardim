class MahalleModel {
  final int id;
  final String name;

  MahalleModel({required this.id, required this.name});

  factory MahalleModel.fromJson({required dynamic json}) {
    return MahalleModel(id: json["mahalleId"], name: json["mahalleAdi"]);
  }

  Map<String,Object> toMap(){
    return {
      "mahalleId":id.toString(),
      "mahalleAdi":name
    };
  }
}
