part of 'product_list_cubit.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState({
    @Default(false) bool isLoading,
    @Default(<ProductModel>[]) List<ProductModel> products,
  }) = _ProductListState;
}
