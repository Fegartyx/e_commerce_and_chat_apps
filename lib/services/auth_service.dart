// untuk melakukan req ke dalam backend
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthService {
  final String baseUrl = 'https://shamo-backend.buildwithangga.id/api';
  // form data sesuai dengan di ui
  Future<UserModel> register({
    required String email,
    required String name,
    required String password,
    required String username,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    // sesuai dengan data post register di api
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    // melakukan post http request
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      // merubah file json menjadi mapping  => data['data']
      var data = jsonDecode(response.body)['data'];
      // mengembalikan data lalu memasukkannya ke object user  => data['data']['user']
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    // sesuai dengan data post register di api
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    // melakukan post http request
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      // merubah file json menjadi mapping  => data['data']
      var data = jsonDecode(response.body)['data'];
      // mengembalikan data lalu memasukkannya ke object user  => data['data']['user']
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
