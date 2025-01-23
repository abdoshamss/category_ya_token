

import 'package:bloc/bloc.dart';
import 'package:category/features/cart/add_cart/add_data/add_cart_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  static AddCubit get(context)=>BlocProvider.of(context);
   AddCubit() : super(AddInitial());

   AddCartData addCartData=AddCartData();
   addCartCubit({required String id}){
    emit(AddLoadingState());
    addCartData.addCart(iD: id);
    emit(AddSuccessState());
  }
  getAllCubit()async{
     emit(AddAllLoadingState());
     var success=await addCartData.getAllDataCart();
     emit(AddAllSuccessState(list: success));
  }
  deleteAllCubit({required String id})async{
     emit(AddAllLoadingState());
     var success=await addCartData.deleteDataCart(deleteId: id);
     emit(DeleteAllLState());
     getAllCubit();
  }
}
