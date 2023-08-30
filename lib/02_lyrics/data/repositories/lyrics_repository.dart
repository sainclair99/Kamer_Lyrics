// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:kamer_lyrics/02_lyrics/data/models/lyrics_model.dart';

class LyricsRepository {
  final Dio dio;
  LyricsRepository({
    required this.dio,
  });

  Future<List<LyricsModel>> fetchAllLyrics() async {
    Response response = await dio.get('/api/lyrics');

    var data = <LyricsModel>[];

    for (var lyrics in response.data) {
      data.add(LyricsModel.fromJson(lyrics));
    }

    return data;
  }

  commentLyrics({
    required String comment,
    required int lyricsId,
  }) async {
    await dio.post(
      '/api/lyrics/$lyricsId/comment',
      queryParameters: {'commentaire': comment},
    );
  }

  likeLyrics({required int lyricsId}) async {
    await dio.post('/api/lyrics/$lyricsId/like');
  }
}
