// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'satellite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SatelliteEntity {

 String get label; Tle get tle;
/// Create a copy of SatelliteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SatelliteEntityCopyWith<SatelliteEntity> get copyWith => _$SatelliteEntityCopyWithImpl<SatelliteEntity>(this as SatelliteEntity, _$identity);

  /// Serializes this SatelliteEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SatelliteEntity&&(identical(other.label, label) || other.label == label)&&(identical(other.tle, tle) || other.tle == tle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,tle);

@override
String toString() {
  return 'SatelliteEntity(label: $label, tle: $tle)';
}


}

/// @nodoc
abstract mixin class $SatelliteEntityCopyWith<$Res>  {
  factory $SatelliteEntityCopyWith(SatelliteEntity value, $Res Function(SatelliteEntity) _then) = _$SatelliteEntityCopyWithImpl;
@useResult
$Res call({
 String label, Tle tle
});


$TleCopyWith<$Res> get tle;

}
/// @nodoc
class _$SatelliteEntityCopyWithImpl<$Res>
    implements $SatelliteEntityCopyWith<$Res> {
  _$SatelliteEntityCopyWithImpl(this._self, this._then);

  final SatelliteEntity _self;
  final $Res Function(SatelliteEntity) _then;

/// Create a copy of SatelliteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? tle = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,tle: null == tle ? _self.tle : tle // ignore: cast_nullable_to_non_nullable
as Tle,
  ));
}
/// Create a copy of SatelliteEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TleCopyWith<$Res> get tle {
  
  return $TleCopyWith<$Res>(_self.tle, (value) {
    return _then(_self.copyWith(tle: value));
  });
}
}


/// Adds pattern-matching-related methods to [SatelliteEntity].
extension SatelliteEntityPatterns on SatelliteEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SatelliteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SatelliteEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SatelliteEntity value)  $default,){
final _that = this;
switch (_that) {
case _SatelliteEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SatelliteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SatelliteEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  Tle tle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SatelliteEntity() when $default != null:
return $default(_that.label,_that.tle);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  Tle tle)  $default,) {final _that = this;
switch (_that) {
case _SatelliteEntity():
return $default(_that.label,_that.tle);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  Tle tle)?  $default,) {final _that = this;
switch (_that) {
case _SatelliteEntity() when $default != null:
return $default(_that.label,_that.tle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SatelliteEntity implements SatelliteEntity {
  const _SatelliteEntity({required this.label, required this.tle});
  factory _SatelliteEntity.fromJson(Map<String, dynamic> json) => _$SatelliteEntityFromJson(json);

@override final  String label;
@override final  Tle tle;

/// Create a copy of SatelliteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SatelliteEntityCopyWith<_SatelliteEntity> get copyWith => __$SatelliteEntityCopyWithImpl<_SatelliteEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SatelliteEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SatelliteEntity&&(identical(other.label, label) || other.label == label)&&(identical(other.tle, tle) || other.tle == tle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,tle);

@override
String toString() {
  return 'SatelliteEntity(label: $label, tle: $tle)';
}


}

/// @nodoc
abstract mixin class _$SatelliteEntityCopyWith<$Res> implements $SatelliteEntityCopyWith<$Res> {
  factory _$SatelliteEntityCopyWith(_SatelliteEntity value, $Res Function(_SatelliteEntity) _then) = __$SatelliteEntityCopyWithImpl;
@override @useResult
$Res call({
 String label, Tle tle
});


@override $TleCopyWith<$Res> get tle;

}
/// @nodoc
class __$SatelliteEntityCopyWithImpl<$Res>
    implements _$SatelliteEntityCopyWith<$Res> {
  __$SatelliteEntityCopyWithImpl(this._self, this._then);

  final _SatelliteEntity _self;
  final $Res Function(_SatelliteEntity) _then;

/// Create a copy of SatelliteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? tle = null,}) {
  return _then(_SatelliteEntity(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,tle: null == tle ? _self.tle : tle // ignore: cast_nullable_to_non_nullable
as Tle,
  ));
}

/// Create a copy of SatelliteEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TleCopyWith<$Res> get tle {
  
  return $TleCopyWith<$Res>(_self.tle, (value) {
    return _then(_self.copyWith(tle: value));
  });
}
}

// dart format on
