import 'package:flutter/material.dart';
import 'text.dart';
import '../order_details/order_details.dart';

class ProductOrder extends StatelessWidget {

  Products producto = Products();

  ProductOrder({this.producto});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          children: <Widget>[
            Image.network(
                this.producto.instructions,
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
                    Text(this.producto.product, style: LLBText.HeaderMedium),
                    Text('Cantidad: ' + this.producto.amount.toString(), style: LLBText.HeaderMedium),
                  ],
                )
            )
          ],
        )
    );
  }
}
