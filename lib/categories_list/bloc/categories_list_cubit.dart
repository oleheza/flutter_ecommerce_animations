import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/model/category_model.dart';
import '../../core/domain/repository/categories_repository.dart';

part 'categories_list_cubit.freezed.dart';
part 'categories_list_state.dart';

class CategoriesListCubit extends Cubit<CategoriesListState> {
  final CategoriesRepository categoriesRepository;

  CategoriesListCubit({
    required this.categoriesRepository,
  }) : super(const CategoriesListState());

  Future<void> loadCategories() async {
    emit(state.copyWith(isLoading: true));
    try {
      final categories = await categoriesRepository.getAllAvailable();
      emit(state.copyWith(isLoading: false, categories: categories));
    } on Exception {
      emit(state.copyWith(isLoading: false));
    }
  }
}
