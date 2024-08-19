import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injector.dart';
import '../bloc/categories_list_cubit.dart';
import 'categories_screen_content.dart';

class CategoriesScreen extends StatelessWidget {
  static const screenName = 'categories';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Categories'),
      ),
      body: BlocProvider(
        create: (context) => CategoriesListCubit(
          categoriesRepository: getIt(),
        )..loadCategories(),
        child: const CategoriesScreenContent(),
      ),
    );
  }
}
