import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:llbapp/config/theme.dart';
import '../widgets/text.dart';
import 'product_details_bloc.dart';
import 'package:bloc/bloc.dart';
import '../cart/cart_bloc.dart';
import '../products/product.dart';

class ProductDetails extends StatelessWidget {

  Product producto;
  List<int> extras = [];

  TextEditingController comentariosController = TextEditingController();

  ProductDetails(this.producto);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                child: Image.network(this.producto.image, fit: BoxFit.cover,),
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 20),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(this.producto.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('\$' + this.producto.price + ' MXN.', style: TextStyle(fontSize: 18, color: Colors.white))
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 20),
                child: Text(this.producto.description,
                style: LLBText.TextDefault,),
              ),
              quantityCounter(context),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 20),
                child: Text('Agregar Extra', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    extraCheckBox(context, 2, "Tocino"),
                    extraCheckBox(context, 3, "Cebolla"),
                    extraCheckBox(context, 4, "Piña"),
                    extraCheckBox(context, 5, "Jalapeño"),
                    extraCheckBox(context, 6, "Salchicha"),
                    extraCheckBox(context, 7, "Queso"),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 20),
                child: Text('Instrucciones adicionales', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: SizedBox(
                    height: 150,
                    child: TextField(
                      controller: comentariosController,
                      decoration: InputDecoration(
                        hintText: "Escribe aqui las instrucciones",
                        filled: true,
                        fillColor: Colors.white
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                  ),
                ),
              ),
              orderButton(context),
            ],
          )
        )
      )
    );
  }

  Widget orderButton (BuildContext context) {
    final ProductDetailsBloc clickedBloc = BlocProvider.of<ProductDetailsBloc>(context);

    double total = double.parse(this.producto.price);

    return BlocBuilder<ProductDetailsBloc, ClickedState> (
      builder: (context, state) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.center,
                child: ButtonTheme(
                minWidth: 200,
                height: 60,
                child: RaisedButton(
                  color: Colors.orange[700],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Agregar al carrito ', style: LLBText.HeaderMedium),
                      Text('\$' + state.orderTotal.toStringAsFixed(2) +  " MXN.", style: LLBText.HeaderMediumBold)
                    ],
                  ),
                  onPressed: () {
                    Product prod = Product(
                      id: this.producto.id,
                      image: this.producto.image,
                      name: this.producto.name,
                      description: this.producto.description,
                      cantidad: state.productQuantity,
                      extras: this.extras,
                      comentarios: this.comentariosController.text,
                      price: this.producto.price
                    );
                    cartBloc.addToCart(prod);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )
              ),
            ),
          )
        );
      }
    );
  }

  Widget quantityCounter (BuildContext context) {
    final ProductDetailsBloc clickedBloc = BlocProvider.of<ProductDetailsBloc>(context);

    int quantity = 1;

    return BlocBuilder<ProductDetailsBloc, ClickedState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: FloatingActionButton(
                  heroTag: 'less',
                  backgroundColor: Colors.blueGrey[800],
                  child: Text('-', style: TextStyle(fontSize: 20),),
                  onPressed: () {
                    if(quantity <= 0) {
                      return; 
                    } else {
                      quantity -= 1;
                      clickedBloc.add(RemoveQuantity(quantity));
                      clickedBloc.add(UpdateTotal(double.parse(this.producto.price) * state.productQuantity));
                      print("Cantidad:: " + state.productQuantity.toString());
                    }
                  },)
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(state.productQuantity.toString(), style: TextStyle(fontSize: 30, color: Colors.white))
              ),
              SizedBox(
                child: FloatingActionButton(
                  heroTag: 'more',
                  backgroundColor: Colors.blueGrey[800],
                  child: Text('+', style: TextStyle(fontSize: 20),),
                  onPressed: () {
                    quantity += 1;
                    clickedBloc.add(AddQuantity(quantity));
                    clickedBloc.add(UpdateTotal(double.parse(this.producto.price) * state.productQuantity));
                    print("Cantidad:: " + state.productQuantity.toString());
                  },)
              ),  
            ],
          )
        );
      }
    );
  }

  Widget extraCheckBox(BuildContext context, int extraID, String extra) {
    final ProductDetailsBloc clickedBloc = BlocProvider.of<ProductDetailsBloc>(context);
    return BlocBuilder<ProductDetailsBloc, ClickedState> (
      builder: (context, state) {

        var value;

        if(extraID == 2) {
          value = state.isTocinoChecked;
        } 
        if(extraID == 3) {
          value = state.isCebollaChecked;
        } 
        if(extraID == 4) {
          value = state.isPinaChecked;
        } 
        if (extraID == 5) {
          value = state.isJalapenoChecked;
        } 
        if (extraID == 6) {
          value = state.isSalchichaChecked;
        } 
        if(extraID == 7) {
          value = state.isQuesoChecked;
        }

        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.orange,
                    value: value,
                    onChanged: (newVal) {
                      if (extraID == 2) {
                        if(newVal) {
                          clickedBloc.add(ExtraTocino(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal + (15 * state.productQuantity)));
                          this.extras.add(2);
                          print("Extra:::::: " + this.extras.length.toString());
                          print("Valor:::: " + newVal.toString());
                        } else if(!newVal) {
                          clickedBloc.add(ExtraTocino(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal - (15 * state.productQuantity)));
                          this.extras.removeWhere((element) => element == 2);
                          print("Valor:::: " + newVal.toString());
                        }
                      } else if (extraID == 3) {
                        if(newVal) {
                          clickedBloc.add(ExtraCebolla(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal + (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        } else if(!newVal) {
                          clickedBloc.add(ExtraCebolla(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal - (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        }
                      } else if (extraID == 4) {
                        if(newVal) {
                          clickedBloc.add(ExtraPina(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal + (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        } else if(!newVal) {
                          clickedBloc.add(ExtraPina(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal - (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        }
                      } else if (extraID == 5) {
                        if(newVal) {
                          clickedBloc.add(ExtraJalapeno(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal + (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        } else if(!newVal) {
                          clickedBloc.add(ExtraJalapeno(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal - (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        }
                      } else if (extraID == 6) {
                        if(newVal) {
                          clickedBloc.add(ExtraSalchicha(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal + (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        } else if(!newVal) {
                          clickedBloc.add(ExtraSalchicha(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal - (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        }
                      } else if (extraID == 7) {
                        if(newVal) {
                          clickedBloc.add(ExtraQueso(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal + (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        } else if(!newVal) {
                          clickedBloc.add(ExtraQueso(newVal));
                          clickedBloc.add(UpdateTotal(state.orderTotal - (15 * state.productQuantity)));
                          print("Valor:::: " + newVal.toString());
                        }
                      }
                      //clickedBloc.add(ExtraIngredient(newVal));
                      //print("Value::: " + state.isChecked.toString());
                    },
                  ),
                  Text(
                    extra,
                    style: LLBText.HeaderMedium
                  ),
                ],
              ),
              Text(
                '\$15.00 MXN.',
                style: LLBText.HeaderMediumBold,
              )
            ],
          )
        );
      },
    );
  }
}
