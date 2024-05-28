// lib/utils/styles.dart
import 'package:flutter/material.dart';
import 'package:shopping_list_app/utils/colors.dart';

class AppStyles {
  static const TextStyle appBarTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle itemTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 16.0,
  );

  static const TextStyle checkedItemTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16.0,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle hintTextStyle = TextStyle(
    color: Colors.grey,
    fontSize: 16.0,
  );

  static const TextStyle errorTextStyle = TextStyle(
    color: Colors.red,
    fontSize: 14.0,
  );

  static const TextStyle emptyListTextStyle = TextStyle(
    color: AppColors.textColor,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
}
