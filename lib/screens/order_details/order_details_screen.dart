import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import '../widgets/text.dart';
import '../widgets/item_order.dart';

class OrderDetails extends StatelessWidget {

  final String text;

  OrderDetails({this.text});
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: AppColors.darkGray,
       body: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60, left: 20),
              child: Text('Orden LLB20284', style: LLBText.HeaderLargeBold),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  new ItemOrder(),
                  new ItemOrder(),
                  new ItemOrder(),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text('Total: \$458.99.', style: LLBText.HeaderExtra,)
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Estado de la orden: ', style: LLBText.HeaderMedium),
                  Text('En preparación ', style: LLBText.HeaderMediumBold)
                ],
              )
            ),
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
            ),
           ],
         ),
       )
     );
   }
}