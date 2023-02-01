import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project2/models/models.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryLoading()) {
    void _onLoadGrocery(LoadGrocery event, Emitter<GroceryState> emit) {
      emit(
        GroceryLoaded(groceries: event.groceries),
      );
    }

    void _onAddGrocery(AddGrocery event, Emitter<GroceryState> emit) {}
    void _onEditGrocery(EditGrocery event, Emitter<GroceryState> emit) {}
    void _onRemoveGrocery(RemoveGrocery event, Emitter<GroceryState> emit) {}

    on<LoadGrocery>(_onLoadGrocery);
    on<AddGrocery>(_onAddGrocery);
    on<EditGrocery>(_onEditGrocery);
    on<RemoveGrocery>(_onRemoveGrocery);
  }
}
