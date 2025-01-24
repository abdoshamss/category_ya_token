import 'dart:developer';

import 'package:category/features/cart/fav/model/fav_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class FavData {
   final Dio dio=Dio();
   Future<List<FavModel>>addFav({required String id})async{
    var response= await dio.post("https://elwekala.onrender.com/favorite",data: {
      "nationalId":"01023045678941",
      "productId":id,
    });
    try {
      if (response.statusCode == 200) {
        List responseData = response.data;
        //log(responseData.toString());
        if (kDebugMode) {
          print(responseData);
        }
      }
    }on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
    throw response;
  }
   Future<List<FavModel>>getFav()async{
    var response= await dio.get("https://elwekala.onrender.com/favorite",data: {
      "nationalId":"01023045678941",
    });
    try {
      if (response.statusCode == 200) {
        List responseData = response.data["favoriteProducts"];
        List<FavModel>list=responseData.map((e) =>FavModel.fromJson(e)).toList();
        if (kDebugMode) {
          print(responseData);
        }
        return list;

        log(responseData.toString());
      }
    }on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
    throw response;
  }

   Future<List<FavModel>>deleteDataCart({required String id}) async {
     var response = await dio
         .delete("https://elwekala.onrender.com/favorite", data: {
       "nationalId":"01023045678941",
       "productId":id,
       "quantity":1

     });
     try {
       if (response.statusCode == 200) {
         List responseData = response.data;
         if (kDebugMode) {
           print(responseData);
         }
       }
     }on DioException catch (error) {
       if (error.response != null) {
         return error.response!.data;
       }
     }
     throw "rrrrrrrrrrrrrrr";
   }


}