import 'package:ecommerce_animatons/about/presentation/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../categories_list/presentation/categories_screen.dart';
import '../../main/presentation/main_screen.dart';
import '../../product_details/presentation/product_details_screen.dart';
import '../../products_list/presentation/products_list_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (ctx, state, child) {
        return MaterialPage(child: MainScreen(child: child));
      },
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          name: CategoriesScreen.screenName,
          pageBuilder: (_, __) => const MaterialPage(child: CategoriesScreen()),
        ),
        GoRoute(
          path: '/about',
          name: AboutScreen.screenName,
          pageBuilder: (_, __) => const MaterialPage(child: AboutScreen()),
        )
      ],
    ),
    GoRoute(
      path: '/${ProductsListScreen.screenName}'
          '/:${ProductsListScreen.paramCategoryId}'
          '/:${ProductsListScreen.paramPhotoUrl}'
          '/:${ProductsListScreen.paramTitle}',
      name: ProductsListScreen.screenName,
      builder: (_, state) {
        final parameters = ProductsListScreen.getParams(state.pathParameters);
        return ProductsListScreen(
          categoryId: parameters.id,
          photoUrl: parameters.photoUrl,
          title: parameters.title,
        );
      },
    ),
    GoRoute(
      path: '/${ProductDetailsScreen.screenName}'
          '/:${ProductDetailsScreen.paramProductId}'
          '/:${ProductDetailsScreen.paramPhotoUrl}'
          '/:${ProductDetailsScreen.paramTitle}',
      name: ProductDetailsScreen.screenName,
      builder: (_, state) {
        final parameters = ProductDetailsScreen.getParams(state.pathParameters);
        return ProductDetailsScreen(
          productId: parameters.id,
          photoUrl: parameters.photoUrl,
          title: parameters.title,
        );
      },
    ),
  ],
  debugLogDiagnostics: true,
);
