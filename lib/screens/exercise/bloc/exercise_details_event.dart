abstract class ExerciseDetailsEvent {}

class LoadExerciseDetailsEvent extends ExerciseDetailsEvent {
  final String exercise;

  LoadExerciseDetailsEvent(this.exercise);
}
