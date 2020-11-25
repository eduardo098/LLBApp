part of 'product_details_bloc.dart';

abstract class ClickedState {
  final bool isChecked;
  final bool isTocinoChecked;
  final bool isCebollaChecked;
  final bool isPinaChecked;
  final bool isJalapenoChecked;
  final bool isSalchichaChecked;
  final bool isQuesoChecked;

  final int productQuantity;
  final double orderTotal;

  final List<int> extras;


  ClickedState({
    this.isChecked,
    this.isTocinoChecked,
    this.isCebollaChecked,
    this.isPinaChecked,
    this.isJalapenoChecked,
    this.isSalchichaChecked,
    this.isQuesoChecked,
    this.productQuantity,
    this.orderTotal,
    this.extras
    });

  bool get getChecked => isChecked;
  bool get getTocinoChecked => isTocinoChecked;
  bool get getCebollaChecked => isCebollaChecked;
  bool get getPinaChecked => isPinaChecked;
  bool get getJalapenoChecked => isJalapenoChecked;
  bool get getSalchichaChecked => isSalchichaChecked;
  bool get getQuesoChecked => isQuesoChecked;
  int get getProductQuantity => productQuantity;
  double get getOrderTotal => orderTotal;
  List<int> get getExtras => extras;


}

class InitializeClickedState extends ClickedState {
  InitializeClickedState () : super (
    isChecked: false,
    isTocinoChecked: false,
    isCebollaChecked: false,
    isPinaChecked: false,
    isJalapenoChecked: false,
    isSalchichaChecked: false,
    isQuesoChecked: false,
    productQuantity: 0,
    orderTotal: 0.0,
    extras: []
  );
}

class NewClickedState extends ClickedState {
  NewClickedState.fromOldClickedState(ClickedState oldState,
  {
    bool isChecked,
    bool isTocinoChecked,
    bool isCebollaChecked,
    bool isPinaChecked,
    bool isJalapenoChecked,
    bool isSalchichaChecked,
    bool isQuesoChecked,
    int productQuantity,
    double orderTotal,
    List<int> extras
  }) : super(
    isChecked: isChecked ?? oldState.isChecked,
    isTocinoChecked: isTocinoChecked ?? oldState.isTocinoChecked,
    isCebollaChecked: isCebollaChecked ?? oldState.isCebollaChecked,
    isPinaChecked: isPinaChecked ?? oldState.isPinaChecked,
    isJalapenoChecked: isJalapenoChecked ?? oldState.isJalapenoChecked,
    isSalchichaChecked: isSalchichaChecked ?? oldState.isSalchichaChecked,
    isQuesoChecked: isQuesoChecked ?? oldState.isQuesoChecked,
    productQuantity: productQuantity ?? oldState.productQuantity,
    orderTotal: orderTotal ?? oldState.orderTotal,
    extras: extras ?? oldState.extras
  );
}