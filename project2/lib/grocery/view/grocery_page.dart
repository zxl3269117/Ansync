import 'package:flutter/material.dart';
import 'package:project2/models/models.dart';

import 'add_grocery_page.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      body: SafeArea(
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
                itemCount: Grocery.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return _groceryCard(Grocery.items[index]);
                },
              ),
              // FloatingActionButton(
              //   child: const Icon(Icons.add),
              //   onPressed: () {},
              // ),
              const AddGroceryPage(),
            ],
          ),
        ),
      ),
    );
  }
}

Card _groceryCard(Grocery item) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${item.id}. ${item.description}'),
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
