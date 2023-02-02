import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryLoading()) {
    void onLoadGrocery(LoadGrocery event, Emitter<GroceryState> emit) {
      emit(
        GroceryLoaded(groceries: event.groceries),
      );
    }

    void onAddGrocery(AddGrocery event, Emitter<GroceryState> emit) {
      final state = this.state;
      if (state is GroceryLoaded) {
        emit(GroceryLoaded(
          groceries: List.from(state.groceries)..add(event.grocery),
        ));
      }
    }

    void onEditGrocery(EditGrocery event, Emitter<GroceryState> emit) {
      final state = this.state;
      if (state is GroceryLoaded) {
        List<Grocery> groceries = state.groceries.map((grocery) {
          return grocery.id == event.grocery.id ? event.grocery : grocery;
        }).toList();

        emit(GroceryLoaded(groceries: groceries));
      }
    }

    void onRemoveGrocery(RemoveGrocery event, Emitter<GroceryState> emit) {
      final state = this.state;
      if (state is GroceryLoaded) {
        List<Grocery> groceries = state.groceries.where((grocery) {
          return grocery.id != event.grocery.id;
        }).toList();

        emit(GroceryLoaded(
          groceries: groceries,
        ));
      }
    }

    on<LoadGrocery>(onLoadGrocery);
    on<AddGrocery>(onAddGrocery);
    on<EditGrocery>(onEditGrocery);
    on<RemoveGrocery>(onRemoveGrocery);
  }
}
