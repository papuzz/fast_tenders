// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CorporatePlanImpl _$$CorporatePlanImplFromJson(Map<String, dynamic> json) =>
    _$CorporatePlanImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      maxSeats: (json['maxSeats'] as num).toInt(),
      usedSeats: (json['usedSeats'] as num).toInt(),
      renewalDate: DateTime.parse(json['renewalDate'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$CorporatePlanImplToJson(_$CorporatePlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'maxSeats': instance.maxSeats,
      'usedSeats': instance.usedSeats,
      'renewalDate': instance.renewalDate.toIso8601String(),
      'isActive': instance.isActive,
    };
