import 'package:bloc/bloc.dart';
import 'package:kamer_lyrics/02_lyrics/data/models/lyrics_model.dart';
import 'package:kamer_lyrics/02_lyrics/data/repositories/lyrics_repository.dart';

part 'lyrics_state.dart';

class LyricsCubit extends Cubit<LyricsState> {
  final LyricsRepository lyricsRepository;
  LyricsCubit({
    required this.lyricsRepository,
  }) : super(LyricsState());

  fetchAllLyrics() async {
    try {
      emit(
        LyricsState(
          isLoadingLyrics: true,
          successLoadingLyrics: false,
          errorLoadingLyrics: false,
        ),
      );
      var data = await lyricsRepository.fetchAllLyrics();
      emit(
        LyricsState(
          lyrics: data,
          isLoadingLyrics: false,
          successLoadingLyrics: true,
          errorLoadingLyrics: false,
        ),
      );
    } catch (e) {
      emit(
        LyricsState(
          isLoadingLyrics: false,
          successLoadingLyrics: false,
          errorLoadingLyrics: true,
          message: e.toString(),
        ),
      );
    }
  }
}
