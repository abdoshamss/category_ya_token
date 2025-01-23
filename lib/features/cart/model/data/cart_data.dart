import 'package:category/core/helper/cache.dart';
import 'package:category/features/all_prodduct/model/all_product_model.dart';
import 'package:category/features/cart/model/cart_model.dart';
import 'package:dio/dio.dart';

class CartData {
    final Dio dio = Dio();

   getDataCart() async {
    var response = await dio
        .get("https://elwekala.onrender.com/product/Laptops", data: {
    });
    try {
      if (response.statusCode == 200) {
        List responseData = response.data["product"];
        print(responseData);
        List<CartModel> listData = responseData.map((e) =>
            CartModel.fromJson(e)).toList();
        print(listData[1].name);
        return listData;
      }
    }on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
   updateDataCart({required String id,required String quantity}) async {
    var response = await dio
        .put("https://elwekala.onrender.com/cart", data: {
      "nationalId":"01023045678941",
      "productId":id,
      "quantity": quantity
    });
    try {
      if (response.statusCode == 200) {
        List responseData = response.data["product"];
        print(responseData);
        return responseData;
      }
    }on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }

}
