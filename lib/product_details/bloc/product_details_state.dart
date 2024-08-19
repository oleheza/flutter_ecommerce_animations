part of 'product_details_cubit.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    @Default(false) bool isLoading,
    ProductModel? product,
  }) = _ProductDetailsState;
}
