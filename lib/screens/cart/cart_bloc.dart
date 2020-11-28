import 'package:rxdart/rxdart.dart';
import 'dart:async';
import '../../repos/products_repository.dart';
import '../../repos/cart_repository.dart';
import '../products/product.dart';

class CartBloc {

  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;

  final List<Product> allItems = [];

  void addToCart(Product producto) {
    allItems.add(producto);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(Product producto) {
    allItems.remove(producto);
    cartStreamController.sink.add(allItems);
  }

  double getTotal() {
    double total = 0.0;
    for(int i = 0; i < allItems.length; i++) {
      total += double.parse(allItems[i].price);
    }
    return total;
  }

  dispose() {
    cartStreamController.close();
  }
}

final cartBloc = CartBloc();