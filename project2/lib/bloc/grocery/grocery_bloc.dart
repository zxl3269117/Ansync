import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';
import '../../shared_preference/shared_pref.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  SharedPref sharedPref = SharedPref();

  GroceryBloc() : super(GroceryLoading()) {
    on<InitGrocery>(onInitGrocery);
    on<AddGrocery>(onAddGrocery);
    on<EditGrocery>(onEditGrocery);
    on<RemoveGrocery>(onRemoveGrocery);
  }

  FutureOr<void> onInitGrocery(
      InitGrocery event, Emitter<GroceryState> emit) async {
    List<Grocery> groceries = await sharedPref.read('grocery');
    emit(GroceryLoaded(groceries: groceries));
  }

  FutureOr<void> onAddGrocery(
      AddGrocery event, Emitter<GroceryState> emit) async {
    final state = this.state;
    if (state is GroceryLoaded) {
      List<Grocery> updated = List.from(state.groceries)..add(event.grocery);

      await sharedPref.save('grocery', updated);

      // print(await sharedPref.read('grocery'));

      emit(GroceryLoaded(
        groceries: updated,
      ));
    }
  }

  FutureOr<void> onEditGrocery(
      EditGrocery event, Emitter<GroceryState> emit) async {
    final state = this.state;
    if (state is GroceryLoaded) {
      List<Grocery> updated = state.groceries.map((grocery) {
        return grocery.id == event.grocery.id ? event.grocery : grocery;
      }).toList();

      await sharedPref.save('grocery', updated);

      emit(GroceryLoaded(groceries: updated));
    }
  }

  FutureOr<void> onRemoveGrocery(
      RemoveGrocery event, Emitter<GroceryState> emit) async {
    final state = this.state;
    if (state is GroceryLoaded) {
      List<Grocery> updated = state.groceries.where((grocery) {
        return grocery.id != event.grocery.id;
      }).toList();

      await sharedPref.save('grocery', updated);

      emit(GroceryLoaded(
        groceries: updated,
      ));
    }
  }
}
