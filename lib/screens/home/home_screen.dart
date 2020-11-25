import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import '../widgets/item_card.dart';
import '../widgets/promo_caroussel.dart';
import '../widgets/text.dart';
import '../products/product.dart';
import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {

  final String text;

  HomeScreen({this.text});
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: AppColors.black,
       body: _buildHomeScreen(context),
     );
   }

    Widget _buildHomeScreen(BuildContext context) {
      productsBloc.getProducts();
      return ListView(
        physics: ScrollPhysics(),
        children: <Widget>[
          PromoCaroussel(),
          Padding(
            child: Text('Más Popular', style: LLBText.TextDefault),
            padding: EdgeInsets.all(10),
          ),
          StreamBuilder<ProductResponse> (
            stream: productsBloc.subject.stream,
            builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  List<Product> data = snapshot.data.products;
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int i) {
                      return ProductTile(data[i]);
                    },
                  );
                }
              }
            },
          ),
        ],
      );
    } 
}
