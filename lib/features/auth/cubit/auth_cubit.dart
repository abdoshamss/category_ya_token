import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../model/data_auth/data_auth.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final DataAuth dataAuth = DataAuth();
  ImagePicker picker = ImagePicker();
  File ?image;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Uint8List bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes);
      if (kDebugMode) {
        print('images = $userImage');
      }
      emit(ChooseImage());
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }

  postDataCubit(
      {required name,
      required email,
      required phone,
      required nationalId,
      required password,
      required token,
      required gender}) async {
    emit(AuthLoadingState());
    var user = await DataAuth.postData(
      name: name,
      email: email,
      phone: phone,
      nationalId: nationalId,
      password: password,
      token: token,
      profileImage: userImage,
      gender: gender,
    );
    emit(AuthSuccessState(userData: user));
  }
  loginCubit({required email, required password}) async {
    emit(AuthLoadingState());
    var success =
    await dataAuth.postDataLogin(email: email, password: password);
    emit(AuthSuccessState(userData: success));
  }
}
