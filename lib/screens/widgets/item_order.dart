import 'package:flutter/material.dart';
import 'text.dart';
import '../products/product.dart';

class ItemOrder extends StatelessWidget {

  Product producto = Product();

  ItemOrder({this.producto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        children: <Widget>[
          Image.network(
            this.producto.image,
            fit: BoxFit.cover,
            height: 70,
            width: 140
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(this.producto.name, style: LLBText.HeaderMedium),
                Text('Cantidad: ' + this.producto.cantidad.toString(), style: LLBText.HeaderMedium),
                Text('Total: \$' + this.producto.price, style: LLBText.HeaderMedium)
              ],
            )
          )
        ],
      )
    );
  }
}
