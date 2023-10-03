import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'exercise_event.dart';
import 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseInitialState());

  Stream<ExerciseState> mapEventToState(ExerciseEvent event) async* {
    if (event is LoadExercisesEvent) {
      yield ExerciseLoadingState();
      try {
        // Fetch exercises from an API or a repository
        List<String> exercises = ['Exercise 1', 'Exercise 2', 'Exercise 3'];
        yield ExerciseLoadedState(exercises);
      } catch (error) {
        yield ExerciseInitialState();
      }
    } else if (event is SelectExerciseEvent) {
      yield ExerciseSelectedState(event.exercise);
    }
  }
}
