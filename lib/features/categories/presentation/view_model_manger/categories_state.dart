part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
  @override
  List<Object> get props => [];
}

class CategoriesGetDataLoadingState extends CategoriesState {
  const CategoriesGetDataLoadingState();
  @override
  List<Object> get props => [];
}

class CategoriesGetDataSuccessfulState extends CategoriesState {
  final CategoriesDataModel model;
  const CategoriesGetDataSuccessfulState(this.model);
  @override
  List<Object> get props => [model];
}

class CategoriesGetDataFailedState extends CategoriesState {
  const CategoriesGetDataFailedState();
  @override
  List<Object> get props => [];
}