import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qassim/core/utils/api_utils/api_error_handler.dart';
import 'package:qassim/core/utils/api_utils/api_response.dart';
import 'package:qassim/features/categories/data/model/category_model.dart';
import 'package:qassim/features/categories/data/repositories/categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepo) : super(const CategoriesInitial());
  final CategoriesRepo _categoriesRepo;

  static CategoriesCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getCategories(BuildContext context) async {
    emit(const CategoriesGetDataLoadingState());
    ApiResponse apiResponse = await _categoriesRepo.getCategories();
    if (apiResponse.response?.statusCode != null &&
        apiResponse.response?.statusCode == 200) {
      emit(CategoriesGetDataSuccessfulState(
          CategoriesDataModel.fromJson(apiResponse.response!.data)));
    } else {
      if (context.mounted) {
        ApiChecker.checkApi(apiResponse, context);
        emit(const CategoriesGetDataFailedState());
      }
    }
  }
}
