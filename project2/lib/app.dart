import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/bloc/grocery/grocery_bloc.dart';
import 'screens/grocery_page.dart';
import 'models/models.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GroceryBloc()
            ..add(
              const LoadGrocery(groceries: [
                Grocery(
                  id: '1',
                  description: 'Tomato',
                ),
                Grocery(
                  id: '2',
                  description: 'Apple',
                ),
              ]),
            ),
        ),
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
