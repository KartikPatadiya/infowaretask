class MusicState {
  final bool isMusicEnabled;
  final String quote;
  final String author;

  MusicState({
    required this.isMusicEnabled,
    required this.quote,
    required this.author,
  });

  MusicState copyWith({
    bool? isMusicEnabled,
    String? quote,
    String? author,
  }) {
    return MusicState(
      isMusicEnabled: isMusicEnabled ?? this.isMusicEnabled,
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }
}
