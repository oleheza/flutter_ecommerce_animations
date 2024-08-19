import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/product_model.dart';
import '../../core/domain/repository/products_repository.dart';

part 'product_list_cubit.freezed.dart';
part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final String categoryId;
  final ProductsRepository productsRepository;

  ProductListCubit({
    required this.categoryId,
    required this.productsRepository,
  }) : super(const ProductListState());

  void loadProducts() async {
    emit(state.copyWith(isLoading: true));

    try {
      final products = await productsRepository.getAllForCategory(categoryId);
      emit(state.copyWith(isLoading: false, products: products));
    } on Exception {
      emit(state.copyWith(isLoading: false));
    }
  }
}
