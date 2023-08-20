// ignore_for_file: public_member_api_docs, sort_constructors_first
class LyricsModel {
  final int id;
  final String titre;
  final String status;
  final String contenu;
  final String? dateSortie;
  final String? video;
  final String? createdAt;
  final String? updatedAt;
  final int? albumId;
  final int userId;
  final String? image;

  LyricsModel({
    required this.id,
    required this.titre,
    required this.status,
    required this.contenu,
    this.dateSortie,
    this.video,
    this.createdAt,
    this.updatedAt,
    this.albumId,
    required this.userId,
    this.image,
  });

  factory LyricsModel.fromJson(Map<String, dynamic> json) => LyricsModel(
        id: json['id'],
        titre: json['titre'],
        status: json['status'],
        contenu: json['contenu'],
        dateSortie: json['date_sortie'],
        video: json['video'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        albumId: json['album_id'],
        userId: json['user_id'],
        image: json['image'],
      );
}
