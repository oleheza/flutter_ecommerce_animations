import 'package:flutter/material.dart';

import 'menu_item.dart';

class MainMenuItemWidget extends StatelessWidget {
  final MenuItem menuItem;
  final ValueChanged<MenuItem> onClick;

  const MainMenuItemWidget({
    super.key,
    required this.menuItem,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onPrimary;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => onClick.call(menuItem),
          child: ListTile(
            leading: Icon(
              menuItem.icon,
              color: textColor,
            ),
            title: Text(
              menuItem.title,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
