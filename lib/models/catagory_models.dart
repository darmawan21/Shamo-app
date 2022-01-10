class CatagoryModel {
  int? id;
  late String name;

  CatagoryModel({
    this.id,
    name,
  });

  CatagoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
