import 'package:flutter/material.dart';
import 'package:llbapp/config/theme.dart';
import 'package:llbapp/repos/products_repository.dart';
import '../widgets/text.dart';
import '../widgets/item_order.dart';
import 'cart_bloc.dart';
import '../products/product.dart';
import 'dart:convert';
import '../../repos/cart_repository.dart';

class CartScreen extends StatefulWidget {

  final String text;


  CartScreen({this.text});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var productList = [];

  CartRepository _cartRepository = CartRepository();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: AppColors.darkGray,
       body: StreamBuilder(
         stream: cartBloc.getStream,
         initialData: cartBloc.allItems,
         // ignore: missing_return
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             // ignore: missing_return
             var data = snapshot.data;
             return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 60, left: 20),
                      child: Text('Finaliza tu orden', style: LLBText.HeaderLargeBold),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          print(data[index].comentarios);
                          OrderProduct producto = OrderProduct(
                            cantidad: data[index].cantidad,
                            comentarios: data[index].comentarios,
                            id: data[index].id,
                            extras: data[index].extras,
                            total: double.parse(data[index].price)
                          );
                          productList.add(producto);
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            background: Container(
                              alignment: AlignmentDirectional.centerEnd,
                              color: Colors.redAccent,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                child: Icon(Icons.delete_sweep, color: Colors.white, size: 30,)
                              )
                            ),
                            onDismissed: (direction){
                              cartBloc.removeFromCart(data[index]);
                            },
                            child: ItemOrder(producto: data[index])
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                        'Agendar Orden',
                        style: LLBText.HeaderLarge
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: InkWell(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today, color: Colors.white),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Selecciona una hora de entrega', style: LLBText.HeaderMedium)
                            )
                          ],
                        )
                      )
                    ),
                    SizedBox(height: 40,),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Total: \$' + cartBloc.getTotal().toStringAsFixed(2), style: LLBText.HeaderExtra,)
                      )
                    ),
                    SizedBox(height: 40,),
                    Align(
                      alignment: Alignment.center,
                        child: ButtonTheme(
                        minWidth: 300,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.orange[900],
                          child: Text('FINALIZAR ORDEN', style: LLBText.HeaderMedium),
                          onPressed: () {
                            final Map items = {
                              "user": 2,
                              "delivery": "2020-11-23 08:00:00",
                              "address": "Xichu, Guanajuato",
                              "products": this.productList
                            };
                            print(json.encode(items));
                            _cartRepository.createOrder(json.encode(items));
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
                        child: Text('Recibiras una notificación cuando tu orden esté lista.',
                        style: LLBText.HeaderSmall,)
                      )
                    ),
                  ],
                ),
              );
           }
         },
       )
     );
   }
}
