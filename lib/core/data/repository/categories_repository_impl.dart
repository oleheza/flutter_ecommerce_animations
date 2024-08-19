import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../config/typedefs.dart';
import '../../domain/model/category_model.dart';
import '../../domain/repository/categories_repository.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  static const _categoriesCollectionPath = 'categories';

  final CollectionReference _collection;

  CategoriesRepositoryImpl({
    required FirebaseFirestore firestore,
  }) : _collection = firestore.collection(_categoriesCollectionPath);

  @override
  Future<List<CategoryModel>> getAllAvailable() async {
    final documents =
        await _collection.where(isAvailableCategoryKey, isEqualTo: true).get();
    return documents.docs.map(
      (e) {
        final map = e.data() as Json;
        return CategoryModel.fromJson(e.id, map);
      },
    ).toList();
  }

  @override
  Future<List<CategoryModel>> getAll() async {
    final documents = await _collection.get();
    return documents.docs.map(
      (e) {
        final map = e as Json;
        return CategoryModel.fromJson(e.id, map);
      },
    ).toList();
  }
}
