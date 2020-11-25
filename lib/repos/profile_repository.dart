import '../screens/products/product.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../screens/profile/profile.dart';

class ProfileRepository {
  String _data;

  static String URL = "https://low-low-burger.herokuapp.com/users/l.loge980708@itses.edu.mx";

  final Dio _dio = Dio();

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Home';
  }

  Future<ProfileResponse> getProfile() async {
    try {
      Response response = await _dio.get(URL);
      print(response.data.toString());
      return ProfileResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return ProfileResponse.withError("$error");
    }
  }

  String get data => _data;
}