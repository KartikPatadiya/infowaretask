abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerRunningState extends TimerState {
  final int remainingTime;

  TimerRunningState(this.remainingTime);
}

class TimerFinishedState extends TimerState {}
