import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHandle {
  final String baseUrl = 'http://restapi.adequateshop.com/api';

  registrationUser(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      final jsonData = json.encode(data);
      final response = await http.post(
        (Uri.parse(baseUrl + url)),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  loginUser({required String url, required Map<String, dynamic> data}) async {
    String bearerToken = '';
    try {
      final jsonData = json.encode(data);
      final response = await http.post(
        (Uri.parse(baseUrl + url)),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        // print(response.body);
        bearerToken = json.decode(response.body.toString())["data"]["Token"];
        return [bearerToken, true];
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  getAllUser({required String url, required String userToken}) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      if (response.statusCode == 200) {
        var resData = json.decode(response.body.toString());
        return resData;
      }
    } catch (e) {
      rethrow;
    }
  }

  getUpdate(
      {required String url,
      required String name,
      required String userToken}) async {
    try {
      final response = await http.put(
        Uri.parse(baseUrl + url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: jsonEncode({
          'name': name,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
