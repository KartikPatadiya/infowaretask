import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'exercise_details_event.dart';
import 'exercise_details_state.dart';

class ExerciseDetailsBloc
    extends Bloc<ExerciseDetailsEvent, ExerciseDetailsState> {
  ExerciseDetailsBloc() : super(ExerciseDetailsInitialState());

  Stream<ExerciseDetailsState> mapEventToState(
      ExerciseDetailsEvent event) async* {
    if (event is LoadExerciseDetailsEvent) {
      yield ExerciseDetailsLoadingState();
      try {
        String instructions = 'Instructions for ${event.exercise}';
        String figureUrl = 'URL to the figure for ${event.exercise}';
        yield ExerciseDetailsLoadedState(
            event.exercise, instructions, figureUrl);
      } catch (error) {
        yield ExerciseDetailsInitialState();
      }
    }
  }
}
