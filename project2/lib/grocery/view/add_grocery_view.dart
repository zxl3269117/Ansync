import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/grocery/cubit/add_grocery_cubit.dart';

class AddGroceryView extends StatelessWidget {
  const AddGroceryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          key: const Key('plus'),
          child: const Icon(Icons.add),
          onPressed: () => context.read<AddGroceryCubit>().increment(),
        ),
        FloatingActionButton(
          key: const Key('minus'),
          child: const Icon(Icons.minimize),
          onPressed: () => context.read<AddGroceryCubit>().decrement(),
        ),
      ],
    );
  }
}
