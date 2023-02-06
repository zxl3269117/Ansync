import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/bloc/grocery/grocery_bloc.dart';
import 'screens/grocery_page.dart';
// import 'models/models.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GroceryBloc()..add(InitGrocery())),
      ],
      child: MaterialApp(
        title: 'Grocery List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GroceryPage(),
      ),
    );
  }
}
