class CategoryModel {
  late int id;
  late String name;

  CategoryModel({required this.name, required this.id});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
