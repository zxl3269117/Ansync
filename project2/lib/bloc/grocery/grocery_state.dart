part of 'grocery_bloc.dart';

abstract class GroceryState extends Equatable {
  const GroceryState();

  @override
  List<Object> get props => [];
}

class GroceryLoading extends GroceryState {}

class GroceryLoaded extends GroceryState {
  final List<Grocery> groceries;

  const GroceryLoaded({
    this.groceries = const <Grocery>[],
  });

  @override
  List<Object> get props => [groceries];
}
