import 'package:rxdart/rxdart.dart';

import '../../repos/products_repository.dart';
import '../products/product.dart';

class HomeBloc {

  final ProductsRepository _productsRepository = ProductsRepository();
  final BehaviorSubject<ProductResponse> _subject = 
    BehaviorSubject<ProductResponse> ();

  getProducts() async {
    ProductResponse response = await _productsRepository.getProducts();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ProductResponse> get subject => _subject;
}

final productsBloc = HomeBloc();