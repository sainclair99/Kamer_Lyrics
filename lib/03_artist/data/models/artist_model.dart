// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kamer_lyrics/02_lyrics/data/models/lyrics_model.dart';

class ArtistModel {
  final int id;
  final String name;
  final String musicalGenre;
  final String? socialNetwork;
  final String? biography;
  final int isUser;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final List<LyricsModel?> lyrics;
  final int followersCount;

  // TODO : complete after album feature done

  ArtistModel({
    required this.id,
    required this.name,
    required this.musicalGenre,
    this.socialNetwork,
    required this.biography,
    required this.isUser,
    this.userId,
    this.createdAt,
    this.updatedAt,
    required this.lyrics,
    required this.followersCount,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      id: json['id'],
      name: json['nom'],
      musicalGenre: json['genre_musical'],
      socialNetwork: json['reseaux_sociaux'],
      biography: json['biographie'],
      isUser: json['est_utilisateur'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      lyrics: json['lyrics'] != null
          ? (json['lyrics'] as List<dynamic>)
              .map((e) => LyricsModel.fromJson(e))
              .toList()
          : [],
      followersCount: json['followers_count'] ?? 0,
    );
  }
}
