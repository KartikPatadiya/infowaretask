import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/screens/timer/bloc/timer_bloc.dart';
import 'package:infowaretask/screens/timer/bloc/timer_event.dart';
import 'package:infowaretask/screens/timer/bloc/timer_state.dart';

class CountdownScreen extends StatefulWidget {
  final int durationInSeconds;

  const CountdownScreen({super.key, required this.durationInSeconds});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(),
      child:
          CountdownScreenContent(durationInSeconds: widget.durationInSeconds),
    );
  }
}

class CountdownScreenContent extends StatefulWidget {
  final int durationInSeconds;

  const CountdownScreenContent({super.key, required this.durationInSeconds});

  @override
  // ignore: library_private_types_in_public_api
  _CountdownScreenContentState createState() => _CountdownScreenContentState();
}

class _CountdownScreenContentState extends State<CountdownScreenContent> {
  @override
  void initState() {
    super.initState();
    // Start the countdown timer when the screen is initialized
    context.read<TimerBloc>().add(StartTimerEvent(widget.durationInSeconds));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Center(
        child: BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            if (state is TimerRunningState) {
              return Text('Time Remaining: ${state.remainingTime} seconds');
            } else if (state is TimerFinishedState) {
              return const Text(
                  'Time\'s up!'); // Or navigate to the next screen
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
