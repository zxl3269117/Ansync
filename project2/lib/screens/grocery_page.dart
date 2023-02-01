import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/bloc/grocery/grocery_bloc.dart';
import 'package:project2/models/models.dart';

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
                        return _groceryCard(state.groceries[index]);
                      },
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {},
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
    );
  }
}

Card _groceryCard(Grocery grocery) {
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
                onPressed: () {},
                icon: const Icon(Icons.remove_circle_outline),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
