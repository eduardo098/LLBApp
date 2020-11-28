import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import 'package:llbapp/screens/order_details/order_details_bloc.dart';
import 'order_details.dart';
import '../widgets/text.dart';
import '../widgets/product_order.dart';
import 'order_details.dart';

class OrderDetails extends StatelessWidget {

  final String ordenID;

  OrderDetails({this.ordenID});

   @override
   Widget build(BuildContext context) {
     ordersDetailsBloc.getProducts(this.ordenID);
     return Scaffold(
       backgroundColor: AppColors.darkGray,
       body: StreamBuilder<OrderDetailsResponse>(
         stream: ordersDetailsBloc.subject.stream,
         builder: (context, AsyncSnapshot<OrderDetailsResponse> snapshot) {
           List data = snapshot.data.orders;
           List products = snapshot.data.orders[0].products;
           var total = snapshot.data.orders[0].total;
           var estado = snapshot.data.orders[0].state;
           return SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(top: 60, left: 20),
                   child: Text('Orden ' + this.ordenID, style: LLBText.HeaderLargeBold),
                 ),
                 Container(
                   padding: EdgeInsets.only(left: 20),
                   child: ListView.builder(
                     itemCount: products.length,
                     shrinkWrap: true,
                     physics: ClampingScrollPhysics(),
                     itemBuilder: (context, int index) {
                       Products product = products[index];
                       return ProductOrder(producto: product,);
                     },
                   ),
                 ),
                 SizedBox(height: 40,),
                 Container(
                     child: Align(
                         alignment: Alignment.center,
                         child: Text('Total: \$' + total.toString(), style: LLBText.HeaderExtra,)
                     )
                 ),
                 Container(
                     padding: EdgeInsets.only(top: 40, bottom: 40),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text('Estado de la orden: ', style: LLBText.HeaderMedium),
                         Text(estado, style: LLBText.HeaderMediumBold)
                       ],
                     )
                 ),/*
                 Align(
                   alignment: Alignment.center,
                   child: ButtonTheme(
                       minWidth: 300,
                       height: 50,
                       child: RaisedButton(
                         color: Colors.red[700],
                         child: Text('CANCELAR ORDEN', style: LLBText.HeaderMedium),
                         onPressed: () {

                         },
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0),
                         ),
                       )
                   ),
                 ),
                 SizedBox(height: 20),
                 Container(
                     child: Align(
                         alignment: Alignment.center,
                         child: Text('Una vez cancelada la orden, tendrás que hacer una orden nueva.',
                           style: LLBText.HeaderSmall,)
                     )
                 ),*/
               ],
             ),
           );
         },
       )
     );
   }
}