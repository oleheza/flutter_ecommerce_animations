import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../products_list/presentation/products_list_screen.dart';
import '../bloc/categories_list_cubit.dart';
import 'categories_list.dart';

class CategoriesScreenContent extends StatelessWidget {
  static const _animationDuration = Duration(seconds: 1);

  const CategoriesScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesListCubit, CategoriesListState>(
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            AnimatedOpacity(
              opacity: state.isLoading ? 1.0 : 0.0,
              duration: _animationDuration,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            AnimatedOpacity(
              opacity: state.isLoading ? 0.0 : 1.0,
              duration: _animationDuration,
              child: CategoriesList(
                categories: state.categories,
                onClick: (category) {
                  context.pushNamed(
                    ProductsListScreen.screenName,
                    pathParameters: ProductsListScreen.buildParams(
                      id: category.id,
                      photoUrl: category.photoUrl,
                      title: category.title,
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
