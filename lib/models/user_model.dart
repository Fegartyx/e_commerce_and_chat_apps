class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.username,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'username': username,
        'profile_photo_url': profilePhotoUrl,
        'token': token,
      };
}
