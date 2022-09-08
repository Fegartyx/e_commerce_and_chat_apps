import 'package:e_commerce_and_chat_apps/models/category_model.dart';

import 'gallery_model.dart';

class ProductModel {
  late int id;
  late String name;
  late double price;
  String? description;
  String? tags;
  CategoryModel? categoryModel;
  DateTime? createdAt;
  DateTime? updatedAt;
  late List<GalleryModel> galleries;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.tags,
    this.categoryModel,
    this.createdAt,
    this.updatedAt,
    required this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    categoryModel = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'tags': tags,
        'category': categoryModel?.toJson(),
        'created_at': createdAt.toString(),
        'updated_at': updatedAt.toString(),
        'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      };
}
