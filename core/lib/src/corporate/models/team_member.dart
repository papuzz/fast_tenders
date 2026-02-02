import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_member.freezed.dart';
part 'team_member.g.dart';

@freezed
class TeamMember with _$TeamMember {
  const factory TeamMember({
    required String id,
    required String name,
    required String email,
    required String role, // 'ADMIN', 'MEMBER'
    String? avatarUrl,
    @Default(false) bool isOnline,
    @Default('active') String status, // 'active', 'pending', 'locked'
  }) = _TeamMember;

  factory TeamMember.fromJson(Map<String, dynamic> json) =>
      _$TeamMemberFromJson(json);
}
