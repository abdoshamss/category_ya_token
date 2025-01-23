

import 'package:bloc/bloc.dart';
import 'package:category/features/cart/fav/model/data/fav_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  static FavCubit get(context)=>BlocProvider.of(context);
  FavCubit() : super(FavInitial());
  final FavData favData=FavData();
  addFavCubit({required String id})async{
    emit(FavLoadingState());
    favData.addFav(id: id);
    emit(FavSuccessState());
  }
  getFavCubit()async{
    emit(FavLoadingState());
    var success=await favData.getFav();

    emit(FavAddSuccessState(list: success));
  }
  deleteFavCubit({required String id})async{
    emit(FavLoadingState());
     favData.deleteDataCart(id: id);
    emit(FavDeleteState());
    getFavCubit();
  }
}
