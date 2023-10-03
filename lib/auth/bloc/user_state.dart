abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSignUpSuccessState extends UserState {}

class UserLoginSuccessState extends UserState {}

class UserErrorState extends UserState {
  final String error;

  UserErrorState(this.error);
}
