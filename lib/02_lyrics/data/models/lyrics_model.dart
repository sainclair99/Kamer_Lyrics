// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../03_artist/data/models/artist_model.dart';
import 'comment_model.dart';

class LyricsModel {
  final int id;
  final String title;
  final String status;
  final String content;
  final String? outCommingDate;
  final String? video;
  final String? createdAt;
  final String? updatedAt;
  final int? albumId;
  final int userId;
  final String? image;
  final List<ArtistModel>? authors;

  // * added attributes
  final List<CommentModel>? comments;
  final int liskesCount;

  LyricsModel({
    required this.id,
    required this.title,
    required this.status,
    required this.content,
    this.outCommingDate,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.albumId,
    required this.userId,
    this.image,
    this.authors,
    this.comments,
    required this.liskesCount,
  });

  factory LyricsModel.fromJson(Map<String, dynamic> json) => LyricsModel(
        id: json['id'],
        title: json['titre'],
        status: json['status'],
        content: json['contenu'],
        outCommingDate: json['date_sortie'],
        video: json['video'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        albumId: json['album_id'],
        userId: json['user_id'],
        image: json['image'],
        authors: json['authors'] != null
            ? (json['authors'] as List<dynamic>)
                .map((e) => ArtistModel.fromJson(e))
                .toList()
            : null,
        comments: json['comments'] != null
            ? (json['comments'] as List<dynamic>)
                .map((e) => CommentModel.fromJson(e))
                .toList()
            : [],
        liskesCount: json['likes_count'] ?? 0,
      );
}
