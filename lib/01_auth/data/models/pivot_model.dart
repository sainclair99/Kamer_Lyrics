class PivotModel {
  final int userId;
  final int roleId;

  PivotModel({
    required this.roleId,
    required this.userId,
  });

  factory PivotModel.fromJson(Map<String, dynamic> json) => PivotModel(
        roleId: json['role_id'],
        userId: json['user_id'],
      );
}
