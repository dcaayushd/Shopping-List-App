// lib/widgets/shopping_list_item.dart
import 'package:flutter/material.dart';
import 'package:shopping_list_app/utils/colors.dart';
import 'package:shopping_list_app/utils/styles.dart';

class ShoppingListItem extends StatelessWidget {
  final String itemName;
  final bool isChecked;
  final VoidCallback onCheckboxChanged;
  final VoidCallback onDelete;

  const ShoppingListItem({super.key, 
    required this.itemName,
    required this.isChecked,
    required this.onCheckboxChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (_) => onCheckboxChanged(),
            activeColor: AppColors.primaryColor,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              itemName,
              style: isChecked
                  ? AppStyles.checkedItemTextStyle
                  : AppStyles.itemTextStyle,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: AppColors.accentColor),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
