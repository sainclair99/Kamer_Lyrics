import 'pivot_model.dart';

class RoleModel {
  final int id;
  final String name;
  final String? createdAt;
  final String? updatedAt;
  final PivotModel pivot;

  RoleModel({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
    required this.pivot,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json['id'],
        name: json['name'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        pivot: PivotModel.fromJson(json['pivot'] as Map<String, dynamic>),
      );
}
