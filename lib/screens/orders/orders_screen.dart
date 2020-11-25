import 'package:flutter/material.dart';
import 'package:llbapp/screens/order_details/order_details_screen.dart';
import '../widgets/text.dart';
import '../widgets/item_order.dart';
import '../order_details/order_details_screen.dart';

class OrderScreen extends StatelessWidget {

  final String text;

  OrderScreen({this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60, left: 20),
              child: Text('Tus ordenes', style: LLBText.HeaderLargeBold),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  order(context),
                  order(context),
                  order(context),
                ],
              )
            )
          ],
        ),
      )
    );
  }

  Widget order(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Orden LLB04223', style: LLBText.HeaderMediumBold,),
          ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              new ItemOrder(),
              new ItemOrder(),
              new ItemOrder(),
            ],
          ),
          SizedBox(height: 30),
          Align(
            alignment: Alignment.center,
              child: ButtonTheme(
              minWidth: 200,
              child: RaisedButton(
                color: Colors.orange[900],
                child: Text('VER DETALLES', style: LLBText.HeaderMedium),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDetails()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              )
            ),
          )
        ],
      )
    );
  }
}