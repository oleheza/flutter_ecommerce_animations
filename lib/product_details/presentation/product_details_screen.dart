import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/typedefs.dart';
import '../../core/di/injector.dart';
import '../bloc/product_details_cubit.dart';
import 'product_details_content.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const screenName = 'products-details';

  static const paramProductId = 'product_id';
  static const paramPhotoUrl = 'photo_url';
  static const paramTitle = 'title';

  final String productId;
  final String photoUrl;
  final String title;

  static PathParams buildParams({
    required String id,
    required String photoUrl,
    required String title,
  }) {
    return <String, String>{
      paramProductId: id,
      paramPhotoUrl: photoUrl,
      paramTitle: title,
    };
  }

  static ({String id, String photoUrl, String title}) getParams(
    PathParams params,
  ) {
    return (
      id: params[paramProductId] ?? '',
      photoUrl: params[paramPhotoUrl] ?? '',
      title: params[paramTitle] ?? '',
    );
  }

  const ProductDetailsScreen({
    super.key,
    required this.productId,
    required this.photoUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(
          productId: productId,
          productRepository: getIt(),
        )..loadProductDetails(),
        child: ProductDetailsContent(
          title: title,
          photoUrl: photoUrl,
        ),
      ),
    );
  }
}
