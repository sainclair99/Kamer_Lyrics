import 'package:bloc/bloc.dart';
import 'package:kamer_lyrics/05_genres/data/genre_model.dart';

import '../../data/genre_repository.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final GenreRepository genreRepository;
  GenreCubit({
    required this.genreRepository,
  }) : super(GenreState());

  fetchAllGenres() async {
    try {
      emit(
        state.copyWith(
          isLoadingGenres: true,
          successLoadingGenres: false,
          errorLoadingGenres: false,
        ),
      );

      var data = await genreRepository.fetchAllGenres();

      emit(state.copyWith(
        genres: data,
        isLoadingGenres: false,
        successLoadingGenres: true,
        errorLoadingGenres: false,
      ));
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingGenres: false,
          successLoadingGenres: false,
          errorLoadingGenres: false,
          message: e.toString(),
        ),
      );
    }
  }
}
