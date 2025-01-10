
import 'package:category/core/model/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategorySuccessState extends CategoryState {
  List<CategoryModel> product;
  CategorySuccessState({required this.product});
}
class CategoryFailureState extends CategoryState {
  final String error;
  CategoryFailureState({required this.error});
}
class CategoryLoadingState extends CategoryState {}
