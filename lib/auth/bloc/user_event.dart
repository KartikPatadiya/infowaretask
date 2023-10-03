import 'package:infowaretask/models/user_model.dart';

abstract class UserEvent {}

class LoginEvent extends UserEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class RegisterEvent extends UserEvent {
  final User user;

  RegisterEvent({required this.user});
}

class LogoutEvent extends UserEvent {}
