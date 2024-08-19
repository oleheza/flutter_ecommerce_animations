import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/typedefs.dart';
import '../../core/di/injector.dart';
import '../bloc/product_list_cubit.dart';
import 'products_list_content.dart';

class ProductsListScreen extends StatelessWidget {
  static const screenName = 'products-list';

  static const paramCategoryId = 'category_id';
  static const paramPhotoUrl = 'photo_url';
  static const paramTitle = 'title';

  final String categoryId;
  final String photoUrl;
  final String title;

  static PathParams buildParams({
    required String id,
    required String photoUrl,
    required String title,
  }) {
    return <String, String>{
      paramCategoryId: id,
      paramPhotoUrl: photoUrl,
      paramTitle: title,
    };
  }

  static ({String id, String photoUrl, String title}) getParams(
    PathParams params,
  ) {
    return (
      id: params[paramCategoryId] ?? '',
      photoUrl: params[paramPhotoUrl] ?? '',
      title: params[paramTitle] ?? '',
    );
  }

  const ProductsListScreen({
    super.key,
    required this.categoryId,
    required this.photoUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductListCubit(
          categoryId: categoryId,
          productsRepository: getIt(),
        )..loadProducts(),
        child: ProductsListContent(
          title: title,
          photoUrl: photoUrl,
        ),
      ),
    );
  }
}
