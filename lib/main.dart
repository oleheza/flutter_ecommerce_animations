import 'package:flutter/material.dart';

import 'app.dart';
import 'core/config/app_initializer.dart' as app_initializer;

void main() async {
  await app_initializer.initialize();
  runApp(const App());
}
