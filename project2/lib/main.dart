import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grocery_observer.dart';
import 'app.dart';

void main() {
  Bloc.observer = GroceryObserver();
  runApp(const GroceryApp());
}
