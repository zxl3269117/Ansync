import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/models/models.dart';
import 'package:project2/bloc/grocery/grocery_bloc.dart';

class AddGroceryScreen extends StatelessWidget {
  const AddGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a grocery'),
      ),
      body: BlocListener<GroceryBloc, GroceryState>(
        listener: (context, state) {
          if (state is GroceryLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Added!'),
              ),
            );
          }
          if (state is GroceryLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _inputField('ID', controllerId),
                _inputField('Description', controllerDescription),
                ElevatedButton(
                  onPressed: () {
                    var grocery = Grocery(
                      id: controllerId.value.text,
                      description: controllerDescription.value.text,
                    );
                    context
                        .read<GroceryBloc>()
                        .add(AddGrocery(grocery: grocery));
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Add Grocery'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _inputField(
    String field,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$field: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextFormField(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
