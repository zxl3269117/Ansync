import 'package:flutter/material.dart';
import 'grocery/view/grocery_page.dart';

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GroceryPage(),
    );
  }
}
