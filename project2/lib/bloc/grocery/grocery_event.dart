part of 'grocery_bloc.dart';

abstract class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object> get props => [];
}

class InitGrocery extends GroceryEvent {
  // final List<Grocery> groceries;
  // const InitGrocery({required this.groceries});

  // @override
  // List<Object> get props => [groceries];
}

class AddGrocery extends GroceryEvent {
  final Grocery grocery;
  const AddGrocery({required this.grocery});

  @override
  List<Grocery> get props => [grocery];
}

class EditGrocery extends GroceryEvent {
  final Grocery grocery;
  const EditGrocery({required this.grocery});

  @override
  List<Grocery> get props => [grocery];
}

class RemoveGrocery extends GroceryEvent {
  final Grocery grocery;
  const RemoveGrocery({required this.grocery});

  @override
  List<Grocery> get props => [grocery];
}
