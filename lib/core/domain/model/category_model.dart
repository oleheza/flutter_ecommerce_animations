import '../../config/typedefs.dart';

const photoUrlCategoryKey = 'photo_url';
const titleCategoryKey = 'title';
const isAvailableCategoryKey = 'is_available';

class CategoryModel {
  final String id;
  final String photoUrl;
  final String title;
  final bool isAvailable;

  CategoryModel({
    required this.id,
    required this.photoUrl,
    required this.title,
    required this.isAvailable,
  });

  CategoryModel.fromJson(String id, Json json)
      : this(
          id: id,
          photoUrl: json[photoUrlCategoryKey],
          title: json[titleCategoryKey],
          isAvailable: json[isAvailableCategoryKey],
        );
}
