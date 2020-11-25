import 'package:flutter/material.dart';
import 'package:llbapp/repos/orders_repository.dart';
import 'package:llbapp/repos/products_repository.dart';
import 'package:llbapp/repos/profile_repository.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import './screens/home/home_screen.dart';
import 'repos/cart_repository.dart';
import 'repos/home_repository.dart';
import './screens/bottom_navigation/bottom_navigation.dart';
import 'screens/app_screen.dart';
import 'package:llbapp/screens/product_details/product_details_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  //runApp(MyApp());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductDetailsBloc>(create: (context) => ProductDetailsBloc())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LowLowBurguer',
      theme: LowLowBurgerTheme.of(context),
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc(
          homePageRepository: HomeRepository(),
          productsRepository: ProductsRepository(),
          profileRepository: ProfileRepository(),
          ordersRepository: OrdersRepository(),
        )
          ..add(AppStarted()),
        child: AppScreen(),
      ),
    );
  }
}

