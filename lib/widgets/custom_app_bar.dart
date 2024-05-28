import 'package:flutter/material.dart';
import 'package:shopping_list_app/utils/colors.dart';
import 'package:shopping_list_app/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onAddItem;
  final bool showAddIcon;

  const CustomAppBar({super.key, required this.onAddItem, this.showAddIcon = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: const Text(
        'Shopping List',
        style: AppStyles.appBarTitleStyle,
      ),
      actions: showAddIcon
          ? [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  _navigateToAddItemScreen(context);
                },
              ),
            ]
          : null,
    );
  }

  void _navigateToAddItemScreen(BuildContext context) async {
    final newItemName = await Navigator.pushNamed(context, '/add-item');
    if (newItemName != null) {
      onAddItem(newItemName as String);
    }
  }
}
