import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/auth/bloc/user_bloc.dart';
import 'package:infowaretask/auth/bloc/user_event.dart';
import 'package:infowaretask/auth/bloc/user_state.dart';
import 'package:infowaretask/models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _numberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _ageController = TextEditingController();

  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  final _sexController = TextEditingController();

  List<String> sexOptions = ['Male', 'Female', 'Other'];
  String selectedSex = 'Male'; // Set an initial value if needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSignUpSuccessState) {
          } else if (state is UserErrorState) {
            // show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserLoadingState) {
            // Show loading indicator while signing up
            return const Center(child: CircularProgressIndicator());
          } else {
            // Show signup form
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _numberController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(labelText: 'Age'),
                  ),
                  TextField(
                    controller: _heightController,
                    decoration: const InputDecoration(labelText: 'Height'),
                  ),
                  TextField(
                    controller: _weightController,
                    decoration: const InputDecoration(labelText: 'Weight'),
                  ),
                  DropdownButtonFormField<String>(
                    value:
                        selectedSex, // The currently selected value (initially 'Male' based on the above initialization)
                    onChanged: (newValue) {
                      // This function will be called when the user selects an option from the dropdown
                      setState(() {
                        selectedSex = newValue!;
                      });
                    },
                    items: sexOptions.map((sex) {
                      return DropdownMenuItem<String>(
                        value: sex,
                        child: Text(sex),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Sex',
                      // You can add additional decoration properties if needed
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Create a User object from the input data
                      User user = User(
                        name: _nameController.text,
                        email: _emailController.text,
                        number: _numberController.text,
                        password: _passwordController.text,
                        age: int.parse(_ageController.text),
                        height: double.parse(_heightController.text),
                        weight: double.parse(_weightController.text),
                        sex: _sexController.text,
                      );
                      // Dispatch SignUpEvent to the BLoC
                      BlocProvider.of<UserBloc>(context)
                          .add(RegisterEvent(user: user));
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
