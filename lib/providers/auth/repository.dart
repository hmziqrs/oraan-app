import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:oraan/configs/Api.dart';
import 'package:oraan/models/User.dart';
import 'package:universal_io/io.dart';

abstract class AuthRepository {
  static Future<User> login({String phone, String password}) async {
    try {
      final body = jsonEncode({
        "userPhone": phone,
        "userPassword": password,
      });

      final resp = await Api.instance.post(
        "/users/login",
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
        data: body,
      );

      if (resp.data != null) {
        final parse = resp.data["data"];
        final userId = parse["userId"];
        if (userId != null) {
          return User(userId: userId);
        }
      }

      return null;
    } catch (e) {
      print("Error $e");
    }
  }
}
