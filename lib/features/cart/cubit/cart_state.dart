
import 'package:category/features/cart/model/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}
class CartLoadingState extends CartState {}
class CartSuccessState extends CartState {
  List<CartModel>list;

  CartSuccessState({required this.list});
}
