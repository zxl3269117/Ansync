import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/grocery/cubit/add_grocery_cubit.dart';
import 'add_grocery_view.dart';

class AddGroceryPage extends StatelessWidget {
  const AddGroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddGroceryCubit(),
      child: const AddGroceryView(),
    );
  }
}
