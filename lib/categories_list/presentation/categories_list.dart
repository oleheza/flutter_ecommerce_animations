import 'package:flutter/material.dart';

import '../../core/domain/model/category_model.dart';
import '../../core/presentation/hero_image.dart';

typedef OnCategoryClickListener = Function(CategoryModel category);

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final OnCategoryClickListener onClick;

  const CategoriesList({
    super.key,
    required this.categories,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid.builder(
          itemBuilder: (ctx, index) {
            final item = categories[index];
            return _CategoryListItem(
              categoryModel: item,
              onCategoryClickListener: onClick,
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          itemCount: categories.length,
        )
      ],
    );
  }
}

class _CategoryListItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final OnCategoryClickListener onCategoryClickListener;

  const _CategoryListItem({
    super.key,
    required this.categoryModel,
    required this.onCategoryClickListener,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: HeroImage(
                tag: categoryModel.photoUrl,
                child: Image.network(
                  categoryModel.photoUrl,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  onCategoryClickListener.call(categoryModel);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              categoryModel.title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
