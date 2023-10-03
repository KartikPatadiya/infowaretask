import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/auth/bloc/user_event.dart';
import 'package:infowaretask/auth/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState());

  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is RegisterEvent) {
      yield UserLoadingState(); // Transition to loading state for signup

      try {
        // Simulate signup API call using Future.delayed
        await Future.delayed(const Duration(seconds: 2));

        // If signup is successful, transition to UserSignUpSuccessState
        yield UserSignUpSuccessState();
      } catch (error) {
        // If there's an error during signup, transition to UserErrorState with an error message
        yield UserErrorState('Failed to sign up: $error');
      }
    } else if (event is LoginEvent) {
      yield UserLoadingState(); // Transition to loading state for login

      try {
        // Simulate authentication logic using Future.delayed
        await Future.delayed(Duration(seconds: 2));

        // For demonstration purposes, always assume successful login
        // If login is successful, transition to UserLoginSuccessState
        yield UserLoginSuccessState();
      } catch (error) {
        // If there's an error during login, transition to UserErrorState with an error message
        yield UserErrorState('Failed to log in: $error');
      }
    }
  }
}
