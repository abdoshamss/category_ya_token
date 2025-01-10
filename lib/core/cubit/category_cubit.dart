

import 'package:bloc/bloc.dart';
import 'package:category/core/data/category_data.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final CategoryData postData = CategoryData();

  getDataCubit(String endpoints) async {
    emit(CategoryLoadingState());
    var response = await postData.getData(endpoints: endpoints);
    print(response);
    emit(CategorySuccessState(product: response));
  }
}

