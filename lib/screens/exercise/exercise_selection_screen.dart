import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/screens/exercise/bloc/exercise_bloc.dart';
import 'package:infowaretask/screens/exercise/bloc/exercise_event.dart';
import 'package:infowaretask/screens/exercise/bloc/exercise_state.dart';

class ExerciseSelectionScreen extends StatefulWidget {
  const ExerciseSelectionScreen({super.key});

  @override
  State<ExerciseSelectionScreen> createState() =>
      _ExerciseSelectionScreenState();
}

class _ExerciseSelectionScreenState extends State<ExerciseSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Exercise'),
      ),
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          if (state is ExerciseInitialState || state is ExerciseLoadingState) {
            // Loading state
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExerciseLoadedState) {
            // Loaded state with exercises
            List<String> exercises = state.exercises;
            return ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                String exercise = exercises[index];
                return ListTile(
                  title: Text(exercise),
                  onTap: () {
                    // Dispatch SelectExerciseEvent when exercise is tapped
                    BlocProvider.of<ExerciseBloc>(context)
                        .add(SelectExerciseEvent(exercise));
                    Navigator.of(context)
                        .pop(); // Close the screen after selection
                  },
                );
              },
            );
          } else if (state is ExerciseSelectedState) {
            // Exercise selected state
            return Center(
              child: Text(
                'Selected Exercise: ${state.selectedExercise}',
                style: const TextStyle(fontSize: 18),
              ),
            );
          }
          return Container(); // Placeholder for other states
        },
      ),
    );
  }
}
