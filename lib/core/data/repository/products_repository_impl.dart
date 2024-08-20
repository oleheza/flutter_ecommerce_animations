import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../config/typedefs.dart';
import '../../domain/model/product_model.dart';
import '../../domain/repository/products_repository.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  static const _collectionName = 'products';

  final CollectionReference _collectionReference;

  ProductsRepositoryImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _collectionReference = firebaseFirestore.collection(_collectionName);

  @override
  Future<List<ProductModel>> getAllForCategory(String categoryId) async {
    final documents = await _collectionReference
        .where(categoryIdProductKey, isEqualTo: categoryId)
        .get();

    return documents.docs.map((e) {
      final json = e.data() as Json;
      return ProductModel.fromJson(e.id, json);
    }).toList();
  }

  @override
  Future<ProductModel> getById(String productId) async {
    final document = await _collectionReference.doc(productId).get();

    final json = document.data() as Json;
    return ProductModel.fromJson(productId, json);
  }
}
