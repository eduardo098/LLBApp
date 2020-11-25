import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import '../../screens/products/product.dart';
import '../../screens/product_details/product_details_screen.dart';

class ProductTileSmall extends StatelessWidget {

  final Product producto;

  ProductTileSmall({this.producto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(this.producto)),
        );
      },
      child: Container(
        height: 300,
        padding: EdgeInsets.all(8),
        color: AppColors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                this.producto.image,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  this.producto.name,
                  style: TextStyle(fontSize: AppSizes.titleFontSize, color: AppColors.white, fontWeight: FontWeight.bold),
                )
              )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  '\$' + this.producto.price,
                  style: TextStyle(fontSize: AppSizes.subTitleFontSize, color: AppColors.white),
                )
              )
            )
          ]
        )
      )
    );
  }
}