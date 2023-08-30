import 'package:dio/dio.dart';

import '../models/artist_model.dart';

class ArtistRepository {
  final Dio dio;
  ArtistRepository({required this.dio});

  Future<List<ArtistModel>?> fetchAllArtists({String? searchContent}) async {
    Map<String, dynamic> queryParameters = {};

    if (searchContent != null) {
      queryParameters['nom'] = searchContent;
      queryParameters['genre_musical'] = searchContent;
    }

    Response response = await dio.get(
      '/api/artists',
      queryParameters: queryParameters,
    );
    var data = <ArtistModel>[];

    for (var artist in response.data) {
      data.add(ArtistModel.fromJson(artist));
    }

    return data;
  }
}
