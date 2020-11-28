import 'package:rxdart/rxdart.dart';

import '../../repos/orders_repository.dart';
import 'order.dart';

class OrdersBloc {

  final OrdersRepository _ordersRepository = OrdersRepository();
  final BehaviorSubject<OrderResponse> _subject =
  BehaviorSubject<OrderResponse> ();

  getProducts() async {
    OrderResponse response = await _ordersRepository.getOrders();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<OrderResponse> get subject => _subject;
}

final ordersBloc = OrdersBloc();