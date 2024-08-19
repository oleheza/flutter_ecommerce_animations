import 'package:flutter/material.dart';

import '../../core/domain/model/product_model.dart';
import '../../core/presentation/hero_image.dart';

typedef OnProductClickListener = Function(ProductModel productModel);

class ProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  final OnProductClickListener onProductClickListener;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.onProductClickListener,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, index) {
        final productModel = products[index];
        return _ProductGridItem(
          productModel: productModel,
          onProductClickListener: onProductClickListener,
        );
      },
      itemCount: products.length,
    );
  }
}

class _ProductGridItem extends StatelessWidget {
  final ProductModel productModel;
  final OnProductClickListener onProductClickListener;

  const _ProductGridItem({
    super.key,
    required this.productModel,
    required this.onProductClickListener,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: HeroImage(
                tag: productModel.photoUrl,
                onTap: () {
                  onProductClickListener.call(productModel);
                },
                child: Image.network(
                  productModel.photoUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productModel.title,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
