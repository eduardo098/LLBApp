import 'package:flutter/material.dart';
import 'package:llbapp/screens/order_details/order_details_screen.dart';
import '../widgets/text.dart';
import '../widgets/item_order.dart';
import '../order_details/order_details_screen.dart';
import 'order.dart';
import 'orders_bloc.dart';

class OrderScreen extends StatelessWidget {

  final String text;

  OrderScreen({this.text});

  @override
  Widget build(BuildContext context) {
    ordersBloc.getProducts();
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<OrderResponse>(
        stream: ordersBloc.subject.stream,
        builder: (context, AsyncSnapshot<OrderResponse> snapshot) {
          List data = snapshot.data.orders;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 20),
                  child: Text('Tus ordenes', style: LLBText.HeaderLargeBold),
                ),
                Container(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, int index) {
                        return order(context, data[index]);
                      },
                    )
                )
              ],
            ),
          );
        },
      )
    );
  }

  Widget order(BuildContext context, Order order) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Orden: ' + order.orden, style: LLBText.HeaderMediumBold,),
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
                    MaterialPageRoute(builder: (context) => OrderDetails(ordenID: order.orden)),
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