import 'package:dio/dio.dart';

abstract class Api {
  static Dio instance = Dio(
    BaseOptions(
      baseUrl: "https://naya-oraan.herokuapp.com",
    ),
  );

  // static init() {
  //   instance = Dio();
  //   instance.options.baseUrl = "https://naya-oraan.herokuapp.com";
  // }
}
