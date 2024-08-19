import 'package:flutter/material.dart';

sealed class MenuItem {
  final IconData icon;
  final String title;

  MenuItem({
    required this.icon,
    required this.title,
  });
}

class HomeMenuItem extends MenuItem {
  HomeMenuItem() : super(icon: Icons.home, title: 'Home');
}

class AboutMenuItem extends MenuItem {
  AboutMenuItem() : super(icon: Icons.info_outline, title: 'About');
}


