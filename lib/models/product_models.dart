import 'package:shamo/models/catagory_models.dart';
import 'package:shamo/models/gallery_models.dart';

class ProductModel {
  int? id;
  late String name;
  double? price;
  late String description;
  String? tags;
  late CatagoryModel category;
  DateTime? createdAt;
  DateTime? updatedAt;
  late List<GalleryModel> galleries;

  ProductModel({
    this.id,
    name,
    this.price,
    description,
    this.tags,
    category,
    this.createdAt,
    this.updatedAt,
    galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CatagoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
