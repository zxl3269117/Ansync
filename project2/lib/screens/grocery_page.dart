import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/bloc/grocery/grocery_bloc.dart';
import 'package:project2/models/models.dart';
import 'package:project2/screens/add_grocery_page.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryLoading) {
            return const CircularProgressIndicator();
          }

          if (state is GroceryLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'items',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.groceries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _groceryCard(context, state.groceries[index]);
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddGroceryScreen(),
            ),
          );
        },
      ),
    );
  }
}

Card _groceryCard(BuildContext context, Grocery grocery) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${grocery.id}. ${grocery.description}'),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  context.read<GroceryBloc>().add(
                        RemoveGrocery(grocery: grocery),
                      );
                },
              ),
            ],
          )
        ],
      ),
    ),
  );
}
