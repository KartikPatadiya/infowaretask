import 'package:flutter_bloc/flutter_bloc.dart';

enum MusicEvent { play, pause }

class BackgroundMusicBloc extends Bloc<MusicEvent, bool> {
  BackgroundMusicBloc() : super(false);

  Stream<bool> mapEventToState(MusicEvent event) async* {
    if (event == MusicEvent.play) {
      yield true; // Play the background music
    } else if (event == MusicEvent.pause) {
      yield false; // Pause the background music
    }
  }
}
