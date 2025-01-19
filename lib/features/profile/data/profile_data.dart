import 'dart:convert';

import 'package:category/features/profile/model/profile_model.dart';
import 'package:dio/dio.dart';

import '../../../core/helper/cash.dart';

class ProfileData {
   Dio dio = Dio();

   getProfileData() async {
    var response = await dio.post("https://elwekala.onrender.com/user/profile",
        data: {"token": getTo});
    try {
      var repoData = response.data;
print(repoData);
      var token=repoData["token"];
      var user = ProfileModelUserData.fromJson(repoData);

      SharedPref.sharedPreferences?.setString("token", token);
      print(user.profileUserModel.profileImage);

      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
