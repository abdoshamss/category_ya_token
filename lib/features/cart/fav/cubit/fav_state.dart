
import 'package:category/features/cart/fav/model/fav_model.dart';

abstract class FavState {}

class FavInitial extends FavState {}
class FavAddSuccessState extends FavState {
  List<FavModel>list;
  FavAddSuccessState({required this.list});
}
class FavSuccessState extends FavState {
}
class FavLoadingState extends FavState {}
class FavDeleteState extends FavState {}
