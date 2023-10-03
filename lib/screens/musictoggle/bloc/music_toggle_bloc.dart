import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infowaretask/screens/musictoggle/bloc/music_toggle_event.dart';
import 'package:infowaretask/screens/musictoggle/bloc/music_toggle_state.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MusicBloc extends Bloc<dynamic, MusicState> {
  MusicBloc() : super(MusicState(isMusicEnabled: true, quote: '', author: ''));

  Stream<MusicState> mapEventToState(dynamic event) async* {
    if (event is MusicToggleEvent) {
      // Toggle the background music state
      bool isEnabled = !state.isMusicEnabled;
      yield state.copyWith(isMusicEnabled: isEnabled);
    } else if (event is QuoteLoadedEvent) {
      // Fetch quote from API and update the state
      try {
        var response =
            await http.get(Uri.parse('https://dummyjson.com/quotes/random'));

        // var response = await http.get('https://dummyjson.com/quotes/random');
        var data = json.decode(response.body);
        String quote = data['quote'];
        String author = data['author'];
        yield state.copyWith(quote: quote, author: author);
      } catch (e) {
        // Handle error, if any
        print('Error fetching quote: $e');
      }
    }
  }
}
