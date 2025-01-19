
import '../model/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {
  final ProfileModelUserData profileModelUserData;

  ProfileSuccess({required this.profileModelUserData});
}
