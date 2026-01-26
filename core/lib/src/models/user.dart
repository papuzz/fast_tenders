import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole {
  @JsonValue('customer')
  customer,
  @JsonValue('business_owner')
  businessOwner,
  @JsonValue('staff')
  staff,
  @JsonValue('admin')
  admin,
}

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? email,
    String? phone,
    required UserRole role,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
