import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';
import '../../repos/home_repository.dart';
import '../../repos/cart_repository.dart';
import '../../repos/products_repository.dart';
import '../../repos/profile_repository.dart';
import '../../repos/orders_repository.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final HomeRepository homePageRepository;
  final ProductsRepository productsRepository;
  final ProfileRepository profileRepository;
  final OrdersRepository ordersRepository;

  int currentIndex = 0;

  BottomNavigationBloc({
    this.homePageRepository,
    this.ordersRepository,
    this.productsRepository,
    this.profileRepository,
  }) : assert(homePageRepository != null),
        assert(ordersRepository != null),
        assert(productsRepository != null),
        assert(profileRepository != null);

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String data = await _getFirstPageData();
        yield FirstPageLoaded(text: data);
      }
      if (this.currentIndex == 1) {
        String data = await _getSecondPageData();
        yield SecondPageLoaded(text: data);
      }
      if (this.currentIndex == 2) {
        String data = await _getSecondPageData();
        yield ThirdPageLoaded(text: data);
      }
      if (this.currentIndex == 3) {
        String data = await _getSecondPageData();
        yield FourthPageLoaded(text: data);
      }
    }
  }

  Future<String> _getFirstPageData() async {
    String data = homePageRepository.data;
    if (data == null) {
      await homePageRepository.fetchData();
      data = homePageRepository.data;
    }
    return data;
  }

  Future<String> _getSecondPageData() async {
    String data = productsRepository.data;
    if (data == null) {
      await productsRepository.fetchData();
      data = productsRepository.data;
    }
    return data;
  }

  Future<String> _getThirdPageData() async {
    String data = ordersRepository.data;
    if (data == null) {
      await ordersRepository.fetchData();
      data = ordersRepository.data;
    }
    return data;
  }
}