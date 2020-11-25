import '../screens/products/product.dart';
import 'package:dio/dio.dart';

class CartRepository {
  String _data;

  static String URL = "https://low-low-burger.herokuapp.com/orders";


  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Home';
  }
  
  final Dio _dio = Dio();

  Future<dynamic> createOrder(orderJSON) async {
    try {
      Response response = await _dio.post(URL, data: orderJSON);
      print("Status::: " + response.statusCode.toString());
      return response.statusCode;
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return ProductResponse.withError("$error");
    }
  }

  String get data => _data;
}