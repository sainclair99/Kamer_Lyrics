class LikeModel {
  final int userId;
  final int lyricsId;
  final String? createdAt;
  final String? updatedAt;

  LikeModel({
    required this.userId,
    required this.lyricsId,
    this.createdAt,
    this.updatedAt,
  });

  factory LikeModel.fromJson(Map<String, dynamic> json) {
    return LikeModel(
      userId: json['user_id'],
      lyricsId: json['lyrics_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
