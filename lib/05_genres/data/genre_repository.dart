import 'package:dio/dio.dart';

import 'genre_model.dart';

class GenreRepository {
  final Dio dio;

  GenreRepository({required this.dio});

  Future<List<GenreModel>> fetchAllGenres() async {
    Response response = await dio.get('/api/genres');

    var data = <GenreModel>[];

    for (var genreJson in response.data['genres']) {
      data.add(GenreModel.fromJson(genreJson));
    }

    return data;
  }
}
