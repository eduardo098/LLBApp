part of 'product_details_bloc.dart';

abstract class ClickedEvent {
  final dynamic payload;
  ClickedEvent(this.payload);
}

class ExtraIngredient extends ClickedEvent {
  ExtraIngredient(bool payload) : super(payload);
}

class ExtraTocino extends ClickedEvent {
  ExtraTocino(bool payload) : super(payload);
}

class ExtraCebolla extends ClickedEvent {
  ExtraCebolla(bool payload) : super(payload);
}

class ExtraPina extends ClickedEvent {
  ExtraPina(bool payload) : super(payload);
}

class ExtraJalapeno extends ClickedEvent {
  ExtraJalapeno(bool payload) : super(payload);
}

class ExtraSalchicha extends ClickedEvent {
  ExtraSalchicha(bool payload) : super(payload);
}

class ExtraQueso extends ClickedEvent {
  ExtraQueso(bool payload) : super(payload);
}

class AddToCart extends ClickedEvent  {
  AddToCart(String payload) : super(payload);
}

class AddQuantity extends ClickedEvent {
  AddQuantity(int payload) : super(payload);
}

class RemoveQuantity extends ClickedEvent {
  RemoveQuantity(int payload) : super(payload);
}

class UpdateTotal extends ClickedEvent {
  UpdateTotal(double payload) : super(payload);
}

class AddExtra extends ClickedEvent {
  AddExtra (double payload) : super(payload);
}