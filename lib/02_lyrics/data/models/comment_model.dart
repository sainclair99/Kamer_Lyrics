class CommentModel {
  final int id;
  final String comment;
  final String date;
  final String? createdAt;
  final String? updatedAt;
  final int userId;
  final int lyricsId;

  CommentModel({
    required this.id,
    required this.comment,
    required this.date,
    this.createdAt,
    this.updatedAt,
    required this.userId,
    required this.lyricsId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'],
        comment: json['commentaire'],
        date: json['date_commentaire'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        userId: json['user_id'],
        lyricsId: json['lyrics_id'],
      );
}
