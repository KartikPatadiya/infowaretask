import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/screens/exercise/bloc/exercise_details_bloc.dart';
import 'package:infowaretask/screens/exercise/bloc/exercise_details_state.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final String selectedExercise;

  ExerciseDetailsScreen({required this.selectedExercise});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseDetailsBloc, ExerciseDetailsState>(
      builder: (context, state) {
        if (state is ExerciseDetailsInitialState ||
            state is ExerciseDetailsLoadingState) {
          // Loading state
          return Scaffold(
            appBar: AppBar(
              title: Text(selectedExercise),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ExerciseDetailsLoadedState) {
          // Loaded state with exercise details
          return Scaffold(
            appBar: AppBar(
              title: Text(state.exercise),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Instructions:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    state.instructions,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Figure:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    state.figureUrl,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Start Exercise'),
                  ),
                ],
              ),
            ),
          );
        }
        return Container(); // Placeholder for other states
      },
    );
  }
}
