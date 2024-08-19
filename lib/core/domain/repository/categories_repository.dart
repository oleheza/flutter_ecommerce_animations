import '../model/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> getAll();

  Future<List<CategoryModel>> getAllAvailable();
}
