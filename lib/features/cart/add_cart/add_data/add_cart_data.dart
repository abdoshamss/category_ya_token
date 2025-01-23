import 'package:category/core/helper/cache.dart';
import 'package:dio/dio.dart';

import '../../../all_prodduct/model/all_product_model.dart';

class AddCartData {
   final Dio dio=Dio();
  addCart({required String iD})async{
    var response=await dio.post("https://elwekala.onrender.com/cart/add",data: {
    "nationalId":CacheHelper.getID(),
    "productId":iD,
    "quantity":"1"

    });
    var data=response.data;
    print(data);
    return data;
  }
    getAllDataCart()async{
    var res=await dio.get("https://elwekala.onrender.com/cart/allProducts",data: {
      "nationalId": "01023045678941"
    });
    try {
      if (res.statusCode == 200) {
        print("====================");
        List resData = res.data["products"];
        print(resData);
        List<CartAllModel> listAllData = resData.map((e) =>
            CartAllModel.fromJson(e)).toList();


        return listAllData;
      }
    }on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
   deleteDataCart({required String deleteId}) async {
     var response = await dio
         .delete("https://elwekala.onrender.com/cart/delete", data: {
       "nationalId":"01023045678941",
       "productId":deleteId,
       "quantity":1

     });
     try {
       if (response.statusCode == 200) {
         List responseData = response.data;
         print(responseData);
       }
     }on DioException catch (error) {
       if (error.response != null) {
         return error.response!.data;
       }
     }
   }

}