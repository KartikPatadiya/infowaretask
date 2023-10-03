abstract class ExerciseDetailsState {}

class ExerciseDetailsInitialState extends ExerciseDetailsState {}

class ExerciseDetailsLoadingState extends ExerciseDetailsState {}

class ExerciseDetailsLoadedState extends ExerciseDetailsState {
  final String exercise;
  final String instructions;
  final String figureUrl;

  ExerciseDetailsLoadedState(this.exercise, this.instructions, this.figureUrl);
}
