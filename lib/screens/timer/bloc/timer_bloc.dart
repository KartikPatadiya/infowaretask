import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/screens/timer/bloc/timer_event.dart';
import 'package:infowaretask/screens/timer/bloc/timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial());

  late Timer _timer;

  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is StartTimerEvent) {
      yield TimerRunningState(event.duration);

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        event.duration--;
        if (event.duration > 0) {
          TimerRunningState(event.duration);
        } else {
          _timer.cancel();
          add(TimerFinishedEvent()); // Dispatch a new event when the timer is finished
        }
      });
    } else if (event is StopTimerEvent) {
      _timer.cancel();
      yield TimerInitial();
    } else if (event is TimerFinishedEvent) {
      // Handle timer finished event if needed
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
