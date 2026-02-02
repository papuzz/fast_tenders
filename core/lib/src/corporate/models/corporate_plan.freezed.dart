// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corporate_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CorporatePlan _$CorporatePlanFromJson(Map<String, dynamic> json) {
  return _CorporatePlan.fromJson(json);
}

/// @nodoc
mixin _$CorporatePlan {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get maxSeats => throw _privateConstructorUsedError;
  int get usedSeats => throw _privateConstructorUsedError;
  DateTime get renewalDate => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this CorporatePlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CorporatePlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CorporatePlanCopyWith<CorporatePlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorporatePlanCopyWith<$Res> {
  factory $CorporatePlanCopyWith(
    CorporatePlan value,
    $Res Function(CorporatePlan) then,
  ) = _$CorporatePlanCopyWithImpl<$Res, CorporatePlan>;
  @useResult
  $Res call({
    String id,
    String name,
    int maxSeats,
    int usedSeats,
    DateTime renewalDate,
    bool isActive,
  });
}

/// @nodoc
class _$CorporatePlanCopyWithImpl<$Res, $Val extends CorporatePlan>
    implements $CorporatePlanCopyWith<$Res> {
  _$CorporatePlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CorporatePlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxSeats = null,
    Object? usedSeats = null,
    Object? renewalDate = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            maxSeats: null == maxSeats
                ? _value.maxSeats
                : maxSeats // ignore: cast_nullable_to_non_nullable
                      as int,
            usedSeats: null == usedSeats
                ? _value.usedSeats
                : usedSeats // ignore: cast_nullable_to_non_nullable
                      as int,
            renewalDate: null == renewalDate
                ? _value.renewalDate
                : renewalDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CorporatePlanImplCopyWith<$Res>
    implements $CorporatePlanCopyWith<$Res> {
  factory _$$CorporatePlanImplCopyWith(
    _$CorporatePlanImpl value,
    $Res Function(_$CorporatePlanImpl) then,
  ) = __$$CorporatePlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int maxSeats,
    int usedSeats,
    DateTime renewalDate,
    bool isActive,
  });
}

/// @nodoc
class __$$CorporatePlanImplCopyWithImpl<$Res>
    extends _$CorporatePlanCopyWithImpl<$Res, _$CorporatePlanImpl>
    implements _$$CorporatePlanImplCopyWith<$Res> {
  __$$CorporatePlanImplCopyWithImpl(
    _$CorporatePlanImpl _value,
    $Res Function(_$CorporatePlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CorporatePlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? maxSeats = null,
    Object? usedSeats = null,
    Object? renewalDate = null,
    Object? isActive = null,
  }) {
    return _then(
      _$CorporatePlanImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        maxSeats: null == maxSeats
            ? _value.maxSeats
            : maxSeats // ignore: cast_nullable_to_non_nullable
                  as int,
        usedSeats: null == usedSeats
            ? _value.usedSeats
            : usedSeats // ignore: cast_nullable_to_non_nullable
                  as int,
        renewalDate: null == renewalDate
            ? _value.renewalDate
            : renewalDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CorporatePlanImpl implements _CorporatePlan {
  const _$CorporatePlanImpl({
    required this.id,
    required this.name,
    required this.maxSeats,
    required this.usedSeats,
    required this.renewalDate,
    required this.isActive,
  });

  factory _$CorporatePlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$CorporatePlanImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int maxSeats;
  @override
  final int usedSeats;
  @override
  final DateTime renewalDate;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'CorporatePlan(id: $id, name: $name, maxSeats: $maxSeats, usedSeats: $usedSeats, renewalDate: $renewalDate, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CorporatePlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.maxSeats, maxSeats) ||
                other.maxSeats == maxSeats) &&
            (identical(other.usedSeats, usedSeats) ||
                other.usedSeats == usedSeats) &&
            (identical(other.renewalDate, renewalDate) ||
                other.renewalDate == renewalDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    maxSeats,
    usedSeats,
    renewalDate,
    isActive,
  );

  /// Create a copy of CorporatePlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CorporatePlanImplCopyWith<_$CorporatePlanImpl> get copyWith =>
      __$$CorporatePlanImplCopyWithImpl<_$CorporatePlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CorporatePlanImplToJson(this);
  }
}

abstract class _CorporatePlan implements CorporatePlan {
  const factory _CorporatePlan({
    required final String id,
    required final String name,
    required final int maxSeats,
    required final int usedSeats,
    required final DateTime renewalDate,
    required final bool isActive,
  }) = _$CorporatePlanImpl;

  factory _CorporatePlan.fromJson(Map<String, dynamic> json) =
      _$CorporatePlanImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get maxSeats;
  @override
  int get usedSeats;
  @override
  DateTime get renewalDate;
  @override
  bool get isActive;

  /// Create a copy of CorporatePlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CorporatePlanImplCopyWith<_$CorporatePlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
