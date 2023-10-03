abstract class ExerciseEvent {}

class LoadExercisesEvent extends ExerciseEvent {}

class SelectExerciseEvent extends ExerciseEvent {
  final String exercise;

  SelectExerciseEvent(this.exercise);
}
