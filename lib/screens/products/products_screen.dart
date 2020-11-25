import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:llbapp/config/theme.dart';
import '../widgets/item_card_small.dart';
import '../product_details/product_details_screen.dart';
import 'products_bloc.dart';
import 'product.dart';

class ProductsScreen extends StatefulWidget {

  final String text;

  ProductsScreen({this.text});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       primary: true,
       extendBody: true,
       backgroundColor: AppColors.black,
       body: _buildProductsScreen(context),
     );
   }

    Widget _buildProductsScreen(BuildContext context) {
      productsBloc.getProducts();
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 10, bottom: 20),
              child: Text('Nuestros Productos', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
            )
          ),
          StreamBuilder<ProductResponse>(
            stream: productsBloc.subject.stream,
            builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  List<Product> data = snapshot.data.products;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7 
                    ),
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductTileSmall(producto: data[index]);
                    }
                  );
                }
              }
            },
          )
        ],
      );
    } 

    Widget productsList() {
      productsBloc.getProducts();
      @override
      Widget build(BuildContext context) {
        return StreamBuilder<ProductResponse>(
          stream: productsBloc.subject.stream,
          builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
            if (snapshot.hasData) {
              List<Product> data = snapshot.data.products;
              print(data.length);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, int index) {
                  return Text(
                    data[index].name,
                    style: TextStyle(color: Colors.white),
                  );
                },
              );
            }
          },
        );
      }
    }
}
