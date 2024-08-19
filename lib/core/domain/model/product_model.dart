import '../../config/typedefs.dart';

const categoryIdProductKey = 'category_id';
const titleProductKey = 'title';
const descriptionProductKey = 'description';
const photoUrlProductKey = 'photo_url';

class ProductModel {
  final String id;
  final String categoryId;
  final String title;
  final String description;
  final String photoUrl;

  ProductModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.photoUrl,
  });

  ProductModel.fromJson(String id, Json json)
      : this(
          id: id,
          categoryId: json[categoryIdProductKey] ?? '',
          title: json[titleProductKey] ?? '',
          description: json[descriptionProductKey] ?? '',
          photoUrl: json[photoUrlProductKey] ?? '',
        );
}
