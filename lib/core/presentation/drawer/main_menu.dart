import 'package:flutter/material.dart';

import 'main_menu_item_widget.dart';
import 'menu_item.dart';

class MainMenu extends StatelessWidget {
  final List<MenuItem> items;
  final ValueChanged<MenuItem> onItemSelected;
  final double width;

  const MainMenu({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      height: MediaQuery.of(context).size.height,
      width: width,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              ...items.map((item) => MainMenuItemWidget(
                    menuItem: item,
                    onClick: onItemSelected,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
