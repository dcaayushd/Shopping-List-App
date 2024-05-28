// lib/main.dart
import 'package:flutter/material.dart';
import 'package:shopping_list_app/screens/home_screen.dart';
import 'package:shopping_list_app/screens/add_item_screen.dart';

void main() {
  runApp(const ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping List App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add-item': (context) => const AddItemScreen(),
      },
    );
  }
}
