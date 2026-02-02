import 'package:freezed_annotation/freezed_annotation.dart';

part 'corporate_plan.freezed.dart';
part 'corporate_plan.g.dart';

@freezed
class CorporatePlan with _$CorporatePlan {
  const factory CorporatePlan({
    required String id,
    required String name,
    required int maxSeats,
    required int usedSeats,
    required DateTime renewalDate,
    required bool isActive,
  }) = _CorporatePlan;

  factory CorporatePlan.fromJson(Map<String, dynamic> json) =>
      _$CorporatePlanFromJson(json);
}
