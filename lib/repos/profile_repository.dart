import '../screens/products/product.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../screens/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  String _data;

  static String URL = "https://low-low-burger.herokuapp.com/login";
  static String PROFILE_URL = "https://low-low-burger.herokuapp.com/users/";

  final Dio _dio = Dio();

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Home';
  }

  Future<ProfileResponse> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Response response = await _dio.get(PROFILE_URL + prefs.getString("email").toString());
      print(response.data.toString());
      return ProfileResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return ProfileResponse.withError("$error");
    }
  }

  Future<ProfileResponse> login(loginJSON) async {
    try {
      Response response = await _dio.post(URL, data: loginJSON);
      print(response.data.toString());
      return ProfileResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return ProfileResponse.withError("$error");
    }
  }

  String get data => _data;
}