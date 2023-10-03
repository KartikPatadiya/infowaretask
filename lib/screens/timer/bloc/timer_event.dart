abstract class TimerEvent {}

class StartTimerEvent extends TimerEvent {
  late final int duration;

  StartTimerEvent(this.duration);
}

class UpdateTimerEvent extends TimerEvent {
  final int remainingTime;

  UpdateTimerEvent(this.remainingTime);
}

class StopTimerEvent extends TimerEvent {}

class TimerFinishedEvent extends TimerEvent {}
