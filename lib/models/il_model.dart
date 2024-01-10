class IlModel {
  final int id;
  final String name;

  IlModel({required this.id, required this.name});

  static IlModel fromJson({required dynamic json}) {
    return IlModel(id: json["ilId"], name: json["ilAdi"]);
  }
}
