import '../model/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> getAllForCategory(String categoryId);

  Future<ProductModel> getById(String productId);
}
