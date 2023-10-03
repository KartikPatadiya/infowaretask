import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/auth/bloc/user_bloc.dart';
import 'package:infowaretask/auth/signin_page.dart';
import 'package:infowaretask/auth/signup_page.dart';
import 'package:infowaretask/screens/exercise/exercise_selection_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Authentication Example',
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/exercise_selection': (context) => const ExerciseSelectionScreen(),
        },
      ),
    );
  }
}



// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:infowaretask/auth/bloc/user_bloc.dart';
// import 'package:infowaretask/auth/signup_page.dart';
// import 'package:infowaretask/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Retrieve user data from SharedPreferences during app launch
//   final prefs = await SharedPreferences.getInstance();
//   final userJson = prefs.getString('user_data');
//   User? user; // Declare User object as nullable

//   if (userJson != null) {
//     user = User.fromJson(json
//         .decode(userJson)); // Assuming User class has a fromJson constructor
//   }

//   runApp(MyApp(user: user));
// }

// class MyApp extends StatelessWidget {
//   final User? user;

//   MyApp({required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Exercise App',
//       home: BlocProvider(
//         create: (context) => UserBloc(),
//         child: SignUpPage(user: user),
//       ),
//     );
//   }
// }
