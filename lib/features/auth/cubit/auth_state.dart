
abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {
  final userData;
  AuthSuccessState( {required this.userData});
}
class AuthFailure extends AuthState {}
class ChooseImage extends AuthState {}
