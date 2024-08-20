import '../model/category_model.dart';

abstract interface class CategoriesRepository {
  Future<List<CategoryModel>> getAll();

  Future<List<CategoryModel>> getAllAvailable();
}
