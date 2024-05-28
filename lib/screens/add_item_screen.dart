import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/custom_app_bar.dart';
import 'package:shopping_list_app/utils/colors.dart';
import 'package:shopping_list_app/utils/styles.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  AddItemScreenState createState() => AddItemScreenState();
}

class AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String _newItemName = '';

  void _saveNewItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Add the new item to the shopping list
      Navigator.pop(context, _newItemName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        onAddItem: (itemName) {},
        showAddIcon: false, // Do not show the "+" icon in the App bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter item name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an item name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newItemName = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveNewItem,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  textStyle: AppStyles.buttonTextStyle,
                ),
                child: const Text(
                  'Add Item',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
