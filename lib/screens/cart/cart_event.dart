part of 'cart_bloc.dart';

abstract class CartEvent {
  final dynamic payload;
  CartEvent(this.payload);
}