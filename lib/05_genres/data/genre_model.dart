import 'package:kamer_lyrics/02_lyrics/data/models/lyrics_model.dart';

class GenreModel {
  final int id;
  final String label;
  final String? createdtAt;
  final String? updtatedAt;
  final String? image;
  final List<LyricsModel?> lyrics;

  GenreModel({
    required this.id,
    required this.label,
    this.createdtAt,
    this.image,
    this.updtatedAt,
    required this.lyrics,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json['id'],
        label: json['label'],
        createdtAt: json['created_at'],
        updtatedAt: json['updated_at'],
        image: json['image'],
        lyrics: json['lyrics'] != null
            ? (json['lyrics'] as List<dynamic>)
                .map((e) => LyricsModel.fromJson(e))
                .toList()
            : [],
      );
}
