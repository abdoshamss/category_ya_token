

import 'package:bloc/bloc.dart';
import 'package:category/features/cart/model/data/cart_data.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartData cartData=CartData();
  getDataCunit()async{
    emit(CartLoadingState());
    var success=await cartData.getDataCart();
    emit(CartSuccessState(list: success));
  }
}
