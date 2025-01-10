import 'package:category/core/model/category_model.dart';
import 'package:dio/dio.dart';

class CategoryData {
  Dio dio = Dio();

  Future<List<CategoryModel>> getData({required String endpoints}) async {
    var response =
    await dio.get("https://fakestoreapi.com/products/category/$endpoints");
    if (response.statusCode == 200) {
      List data = response.data;
      List<CategoryModel> listCategory =
      data.map((item) => CategoryModel.fromJson(item)).toList();
      return listCategory;
    } else {
      throw Exception("fail");
    }
  }
}
