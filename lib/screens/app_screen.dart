import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llbapp/screens/home/home_screen.dart';
import '../screens/bottom_navigation/bottom_navigation.dart';
import 'pages.dart';

import 'cart/cart_screen.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoaded) {
            return HomeScreen(text: state.text);
          }
          if (state is SecondPageLoaded) {
            return ProductsScreen(text: state.text);
          }
          if (state is ThirdPageLoaded) {
            return OrderScreen(text: state.text);
          }
          if (state is FourthPageLoaded) {
            return ProfileScreen(text: state.text);
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
            return BottomNavigationBar(
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.white,
              currentIndex: bottomNavigationBloc.currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.home),
                  title: Text('Inicio',),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.fastfood),
                  title: Text('Productos'),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.book),
                  title: Text('Ordenes',),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.person),
                  title: Text('Cuenta'),
                ),
              ],
              onTap: (index) => bottomNavigationBloc.add(PageTapped(index: index)),
            );
          }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          )
        },
        label: Text('Carrito', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.shopping_cart, color: Colors.white,),
        backgroundColor: Colors.orange[900],
      ),
    );
  }
}