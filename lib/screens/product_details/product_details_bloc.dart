import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailsBloc extends Bloc<ClickedEvent, ClickedState> {
  @override
  ClickedState get initialState => InitializeClickedState(); 

  @override
  Stream<ClickedState> mapEventToState(ClickedEvent event) async* {
    if (event is ExtraIngredient) {
      yield NewClickedState.fromOldClickedState(state, isChecked: event.payload);
    }

    if (event is ExtraTocino) {
      yield NewClickedState.fromOldClickedState(state, isTocinoChecked: event.payload);
    }

    if (event is ExtraCebolla) {
      yield NewClickedState.fromOldClickedState(state, isCebollaChecked: event.payload);
    } 

    if (event is ExtraPina) {
      yield NewClickedState.fromOldClickedState(state, isPinaChecked: event.payload);
    }

    if(event is ExtraJalapeno) {
      yield NewClickedState.fromOldClickedState(state, isJalapenoChecked: event.payload);
    }

    if(event is ExtraSalchicha) {
      yield NewClickedState.fromOldClickedState(state, isSalchichaChecked: event.payload);
    } 

    if(event is ExtraQueso) {
      yield NewClickedState.fromOldClickedState(state, isQuesoChecked: event.payload);
    }

    if(event is AddQuantity) {
      yield NewClickedState.fromOldClickedState(state, productQuantity: event.payload);
    }

    if (event is RemoveQuantity) {
      yield NewClickedState.fromOldClickedState(state, productQuantity: event.payload);
    }

    if (event is UpdateTotal) {
      yield NewClickedState.fromOldClickedState(state, orderTotal: event.payload);
    }

    if (event is AddExtra) {
      yield NewClickedState.fromOldClickedState(state, extras: event.payload);
    }
  }
}