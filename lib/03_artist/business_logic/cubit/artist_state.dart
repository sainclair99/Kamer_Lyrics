// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'artist_cubit.dart';

class ArtistState {
  List<ArtistModel>? artists;
  bool isLoadingArtists;
  bool successLoadingArtists;
  bool errorLoadingArtists;
  String? message;
  
  ArtistState({
    this.artists,
    this.isLoadingArtists = false,
    this.successLoadingArtists = false,
    this.errorLoadingArtists = false,
    this.message,
  });

  ArtistState copyWith({
    List<ArtistModel>? artists,
    bool? isLoadingArtists,
    bool? successLoadingArtists,
    bool? errorLoadingArtists,
    String? message,
  }) {
    return ArtistState(
      artists: artists ?? this.artists,
      isLoadingArtists: isLoadingArtists ?? this.isLoadingArtists,
      successLoadingArtists: successLoadingArtists ?? this.successLoadingArtists,
      errorLoadingArtists: errorLoadingArtists ?? this.errorLoadingArtists,
      message: message ?? this.message,
    );
  }
}
