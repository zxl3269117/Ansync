import '../../models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGroceryCubit extends Cubit<int> {
  AddGroceryCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
