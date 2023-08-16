part of 'lyrics_cubit.dart';

class LyricsState {
  List<LyricsModel>? lyrics;
  bool isLoadingLyrics;
  bool successLoadingLyrics;
  bool errorLoadingLyrics;
  String? message;

  LyricsState({
    this.lyrics,
    this.isLoadingLyrics = false,
    this.successLoadingLyrics = false,
    this.errorLoadingLyrics = false,
    this.message,
  });

  LyricsState copyWith({
    List<LyricsModel>? lyrics,
    bool? isLoadingLyrics,
    bool? successLoadingLyrics,
    bool? errorLoadingLyrics,
    String? message,
  }) =>
      LyricsState(
        lyrics: lyrics ?? this.lyrics,
        isLoadingLyrics: isLoadingLyrics ?? this.isLoadingLyrics,
        successLoadingLyrics: successLoadingLyrics ?? this.successLoadingLyrics,
        errorLoadingLyrics: errorLoadingLyrics ?? this.errorLoadingLyrics,
        message: message ?? this.message,
      );
}
