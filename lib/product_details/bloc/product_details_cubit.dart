import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/product_model.dart';
import '../../core/domain/repository/products_repository.dart';

part 'product_details_cubit.freezed.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final String productId;
  final ProductsRepository productRepository;

  ProductDetailsCubit({
    required this.productId,
    required this.productRepository,
  }) : super(const ProductDetailsState());

  void loadProductDetails() async {
    emit(state.copyWith(isLoading: true));
    try {
      final product = await productRepository.getById(productId);
      emit(state.copyWith(isLoading: false, product: product));
    } on Exception {
      emit(state.copyWith(isLoading: false));
    }
  }
}
