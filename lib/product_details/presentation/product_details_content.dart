import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_details_cubit.dart';

class ProductDetailsContent extends StatelessWidget {
  final String title;
  final String photoUrl;

  const ProductDetailsContent({
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
          pinned: true,
          floating: true,
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
        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (ctx, state) {
            return SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverToBoxAdapter(
                child: Text(state.product?.description ?? ''),
              ),
            );
          },
        ),
      ],
    );
  }
}
