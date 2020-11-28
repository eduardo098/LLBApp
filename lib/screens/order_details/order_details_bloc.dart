import 'package:rxdart/rxdart.dart';

import '../../repos/order_details_repository.dart';
import 'order_details.dart';

class OrdersBloc {

  final OrderDetailsRepository _ordersRepository = OrderDetailsRepository();
  final BehaviorSubject<OrderDetailsResponse> _subject =
  BehaviorSubject<OrderDetailsResponse> ();

  getProducts(String ordenID) async {
    OrderDetailsResponse response = await _ordersRepository.getOrderDetails(ordenID);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<OrderDetailsResponse> get subject => _subject;
}

final ordersDetailsBloc = OrdersBloc();