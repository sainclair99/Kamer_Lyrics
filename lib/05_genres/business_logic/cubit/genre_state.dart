// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'genre_cubit.dart';

class GenreState {
  final List<GenreModel>? genres;
  final bool isLoadingGenres;
  final bool successLoadingGenres;
  final bool errorLoadingGenres;
  final String? message;

  GenreState({
    this.genres,
    this.isLoadingGenres = false,
    this.successLoadingGenres = false,
    this.errorLoadingGenres = false,
    this.message,
  });

  GenreState copyWith({
    List<GenreModel>? genres,
    bool? isLoadingGenres,
    bool? successLoadingGenres,
    bool? errorLoadingGenres,
    String? message,
  }) {
    return GenreState(
      genres: genres ?? this.genres,
      isLoadingGenres: isLoadingGenres ?? this.isLoadingGenres,
      successLoadingGenres: successLoadingGenres ?? this.successLoadingGenres,
      errorLoadingGenres: errorLoadingGenres ?? this.errorLoadingGenres,
      message: message ?? this.message,
    );
  }
}
