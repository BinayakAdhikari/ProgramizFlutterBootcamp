// import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

// @JsonSerializable()
class UserModel {
  final String displayName;
  final String email;

  UserModel({required this.displayName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
