import 'package:bloc/bloc.dart';
import 'package:kamer_lyrics/03_artist/data/repositories/artist_repository.dart';

import '../../data/models/artist_model.dart';

part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  final ArtistRepository artistRepository;

  ArtistCubit({
    required this.artistRepository,
  }) : super(ArtistState());

  fetchAllArtists() async {
    try {
      emit(
        state.copyWith(
          isLoadingArtists: true,
          successLoadingArtists: false,
          errorLoadingArtists: false,
        ),
      );
      var data = await artistRepository.fetchAllArtists();
      emit(
        state.copyWith(
          artists: data,
          isLoadingArtists: false,
          successLoadingArtists: true,
          errorLoadingArtists: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingArtists: false,
          successLoadingArtists: false,
          errorLoadingArtists: true,
          message: e.toString(),
        ),
      );
    }
  }
}
