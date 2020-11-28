import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/orders/order.dart';

class OrdersRepository {
  String _data;

  final String USER_ORDERS_URL = "https://low-low-burger.herokuapp.com/userOrders/";

  final Dio _dio = Dio();

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Orders';
  }

  String get data => _data;


  Future<OrderResponse> getOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.get("id");
    try {
      var url = USER_ORDERS_URL + id.toString();
      print("URL::::: " + url);
      Response response = await _dio.get(USER_ORDERS_URL + id.toString());
      print(response.data);
      return OrderResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occurred: $error stackTrace: $stacktrace");
      return OrderResponse.withError("$error");
    }
  }
}