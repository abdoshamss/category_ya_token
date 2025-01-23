
import '../../../all_prodduct/model/all_product_model.dart';

abstract class AddState {}

class AddInitial extends AddState {}
class AddSuccessState extends AddState {}
class AddLoadingState extends AddState {}
class AddAllLoadingState extends AddState {}
class DeleteAllLState extends AddState {
}
class AddAllSuccessState extends AddState {
  List<CartAllModel>list;
  AddAllSuccessState({required this.list});
}

