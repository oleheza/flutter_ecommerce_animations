part of 'categories_list_cubit.dart';

@freezed
class CategoriesListState with _$CategoriesListState {
  const factory CategoriesListState({
    @Default(false) bool isLoading,
    @Default(<CategoryModel>[]) List<CategoryModel> categories,
  }) = _CategoriesListState;
}
