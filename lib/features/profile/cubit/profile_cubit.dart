

import 'package:bloc/bloc.dart';
import 'package:category/features/profile/cubit/profile_state.dart';
import 'package:category/features/profile/data/profile_data.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileData profileData=ProfileData();
  ProfileCubit() : super(ProfileInitial());
  getProfileCubit()async{
    emit(ProfileLoading());
    var success=await profileData.getProfileData();
    emit(ProfileSuccess(profileModelUserData: success));
  }
}
