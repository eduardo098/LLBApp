import '../screens/products/product.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ProductsRepository {

  static String URL = "https://low-low-burger.herokuapp.com/products";

  final Dio _dio = Dio();

  Future<ProductResponse> getProducts() async {
    try {
      Response response = await _dio.get(URL);
      return ProductResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }

  String _data;

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Home';
  }

  String get data => _data;
}