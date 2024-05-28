// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/custom_app_bar.dart';
import 'package:shopping_list_app/widgets/shopping_list_item.dart';
import 'package:shopping_list_app/utils/colors.dart';
import 'package:shopping_list_app/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> shoppingList = [];
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    // Load the initial shopping list and checked states from a data source (e.g., local storage, database)
    _loadShoppingList();
  }

  void _loadShoppingList() {
    // Load the shopping list and checked states from a data source
    // and update the state
    setState(() {
      shoppingList = [];
      isCheckedList = [];
    });
  }

  void _addItem(String itemName) {
    setState(() {
      shoppingList.add(itemName);
      isCheckedList.add(false);
    });
  }

  void _toggleItemChecked(int index) {
    setState(() {
      isCheckedList[index] = !isCheckedList[index];
    });
  }

  void _deleteItem(int index) {
    setState(() {
      shoppingList.removeAt(index);
      isCheckedList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        onAddItem: (itemName) {
          _addItem(itemName);
        },
      ),
      body: shoppingList.isEmpty
          ? const Center(
              child: Text(
                'No items in the list.\nAdd items to the list',
                style: AppStyles.emptyListTextStyle,
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: shoppingList.length,
              itemBuilder: (context, index) {
                return ShoppingListItem(
                  itemName: shoppingList[index],
                  isChecked: isCheckedList[index],
                  onCheckboxChanged: () => _toggleItemChecked(index),
                  onDelete: () => _deleteItem(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          // Navigate to the Add Item screen
          _navigateToAddItemScreen(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _navigateToAddItemScreen(BuildContext context) async {
    final newItemName = await Navigator.pushNamed(context, '/add-item');
    if (newItemName != null) {
      _addItem(newItemName as String);
    }
  }
}
