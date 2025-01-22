import 'package:dio/dio.dart';

class AddCartData {
  final Dio dio=Dio();
  addCart()async{
    var response=await dio.post("https://elwekala.onrender.com/cart/add",data: {
    "nationalId":"01023045678941",
    "productId":"64666d3a91c71d884185b774",
    "quantity":"1"

    });
    var data=response.data;
    print(data);
    return data;
  }
}