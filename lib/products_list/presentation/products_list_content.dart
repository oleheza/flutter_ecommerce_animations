import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../product_details/presentation/product_details_screen.dart';
import '../bloc/product_list_cubit.dart';
import 'products_grid.dart';

class ProductsListContent extends StatelessWidget {
  final String title;
  final String photoUrl;

  const ProductsListContent({
    super.key,
    required this.title,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: size,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black),
            ),
            background: Hero(
              tag: photoUrl,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  photoUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<ProductListCubit, ProductListState>(
          builder: (context, state) {
            return SliverAnimatedOpacity(
              sliver: ProductsGrid(
                products: state.products,
                onProductClickListener: (product) {
                  context.pushNamed(
                    ProductDetailsScreen.screenName,
                    pathParameters: ProductDetailsScreen.buildParams(
                      id: product.id,
                      photoUrl: product.photoUrl,
                      title: product.title,
                    ),
                  );
                },
              ),
              opacity: state.isLoading ? 0.0 : 1.0,
              duration: const Duration(seconds: 1),
            );
          },
        )
      ],
    );
  }
}
