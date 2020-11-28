import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/order_details/order_details.dart';

class OrderDetailsRepository {
  String _data;

  final String USER_ORDERS_URL = "https://low-low-burger.herokuapp.com/orders/";

  final Dio _dio = Dio();

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Orders';
  }

  String get data => _data;


  Future<OrderDetailsResponse> getOrderDetails(String ordenID) async {
    try {
      Response response = await _dio.get(USER_ORDERS_URL + ordenID);
      print(response.data);
      return OrderDetailsResponse.fromJson(response.data);
    } catch (error, stacktrace){
      print("Exception occurred: $error stackTrace: $stacktrace");
      return OrderDetailsResponse.withError("$error");
    }
  }
}