import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import '../products/product.dart';
import '../product_details/product_details_screen.dart';

class ProductTile extends StatelessWidget {

  Product producto; 

  ProductTile(this.producto);

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
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width - 2,
        color: AppColors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                producto.image,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10,),
                child: Text(
                  producto.name,
                  style: TextStyle(fontSize: AppSizes.titleFontSize, color: AppColors.white, fontWeight: FontWeight.bold),
                )
              )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10,),
                child: Text(
                  '\$' + producto.price + " MXN.",
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