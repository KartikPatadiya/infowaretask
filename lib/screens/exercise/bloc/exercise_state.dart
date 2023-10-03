abstract class ExerciseState {}

class ExerciseInitialState extends ExerciseState {}

class ExerciseLoadingState extends ExerciseState {}

class ExerciseLoadedState extends ExerciseState {
  final List<String> exercises;

  ExerciseLoadedState(this.exercises);
}

class ExerciseSelectedState extends ExerciseState {
  final String selectedExercise;

  ExerciseSelectedState(this.selectedExercise);
}
