// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tle {

 String get name; String get line1; String get line2; int get noradCatId; String get intlDesignator; double get epochYear; double get inclination; double get raan; double get eccentricity; double get argumentOfPerigee; double get meanAnomaly; double get meanMotion;
/// Create a copy of Tle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TleCopyWith<Tle> get copyWith => _$TleCopyWithImpl<Tle>(this as Tle, _$identity);

  /// Serializes this Tle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tle&&(identical(other.name, name) || other.name == name)&&(identical(other.line1, line1) || other.line1 == line1)&&(identical(other.line2, line2) || other.line2 == line2)&&(identical(other.noradCatId, noradCatId) || other.noradCatId == noradCatId)&&(identical(other.intlDesignator, intlDesignator) || other.intlDesignator == intlDesignator)&&(identical(other.epochYear, epochYear) || other.epochYear == epochYear)&&(identical(other.inclination, inclination) || other.inclination == inclination)&&(identical(other.raan, raan) || other.raan == raan)&&(identical(other.eccentricity, eccentricity) || other.eccentricity == eccentricity)&&(identical(other.argumentOfPerigee, argumentOfPerigee) || other.argumentOfPerigee == argumentOfPerigee)&&(identical(other.meanAnomaly, meanAnomaly) || other.meanAnomaly == meanAnomaly)&&(identical(other.meanMotion, meanMotion) || other.meanMotion == meanMotion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,line1,line2,noradCatId,intlDesignator,epochYear,inclination,raan,eccentricity,argumentOfPerigee,meanAnomaly,meanMotion);

@override
String toString() {
  return 'Tle(name: $name, line1: $line1, line2: $line2, noradCatId: $noradCatId, intlDesignator: $intlDesignator, epochYear: $epochYear, inclination: $inclination, raan: $raan, eccentricity: $eccentricity, argumentOfPerigee: $argumentOfPerigee, meanAnomaly: $meanAnomaly, meanMotion: $meanMotion)';
}


}

/// @nodoc
abstract mixin class $TleCopyWith<$Res>  {
  factory $TleCopyWith(Tle value, $Res Function(Tle) _then) = _$TleCopyWithImpl;
@useResult
$Res call({
 String name, String line1, String line2, int noradCatId, String intlDesignator, double epochYear, double inclination, double raan, double eccentricity, double argumentOfPerigee, double meanAnomaly, double meanMotion
});




}
/// @nodoc
class _$TleCopyWithImpl<$Res>
    implements $TleCopyWith<$Res> {
  _$TleCopyWithImpl(this._self, this._then);

  final Tle _self;
  final $Res Function(Tle) _then;

/// Create a copy of Tle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? line1 = null,Object? line2 = null,Object? noradCatId = null,Object? intlDesignator = null,Object? epochYear = null,Object? inclination = null,Object? raan = null,Object? eccentricity = null,Object? argumentOfPerigee = null,Object? meanAnomaly = null,Object? meanMotion = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: null == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String,noradCatId: null == noradCatId ? _self.noradCatId : noradCatId // ignore: cast_nullable_to_non_nullable
as int,intlDesignator: null == intlDesignator ? _self.intlDesignator : intlDesignator // ignore: cast_nullable_to_non_nullable
as String,epochYear: null == epochYear ? _self.epochYear : epochYear // ignore: cast_nullable_to_non_nullable
as double,inclination: null == inclination ? _self.inclination : inclination // ignore: cast_nullable_to_non_nullable
as double,raan: null == raan ? _self.raan : raan // ignore: cast_nullable_to_non_nullable
as double,eccentricity: null == eccentricity ? _self.eccentricity : eccentricity // ignore: cast_nullable_to_non_nullable
as double,argumentOfPerigee: null == argumentOfPerigee ? _self.argumentOfPerigee : argumentOfPerigee // ignore: cast_nullable_to_non_nullable
as double,meanAnomaly: null == meanAnomaly ? _self.meanAnomaly : meanAnomaly // ignore: cast_nullable_to_non_nullable
as double,meanMotion: null == meanMotion ? _self.meanMotion : meanMotion // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Tle].
extension TlePatterns on Tle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tle value)  $default,){
final _that = this;
switch (_that) {
case _Tle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tle value)?  $default,){
final _that = this;
switch (_that) {
case _Tle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String line1,  String line2,  int noradCatId,  String intlDesignator,  double epochYear,  double inclination,  double raan,  double eccentricity,  double argumentOfPerigee,  double meanAnomaly,  double meanMotion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tle() when $default != null:
return $default(_that.name,_that.line1,_that.line2,_that.noradCatId,_that.intlDesignator,_that.epochYear,_that.inclination,_that.raan,_that.eccentricity,_that.argumentOfPerigee,_that.meanAnomaly,_that.meanMotion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String line1,  String line2,  int noradCatId,  String intlDesignator,  double epochYear,  double inclination,  double raan,  double eccentricity,  double argumentOfPerigee,  double meanAnomaly,  double meanMotion)  $default,) {final _that = this;
switch (_that) {
case _Tle():
return $default(_that.name,_that.line1,_that.line2,_that.noradCatId,_that.intlDesignator,_that.epochYear,_that.inclination,_that.raan,_that.eccentricity,_that.argumentOfPerigee,_that.meanAnomaly,_that.meanMotion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String line1,  String line2,  int noradCatId,  String intlDesignator,  double epochYear,  double inclination,  double raan,  double eccentricity,  double argumentOfPerigee,  double meanAnomaly,  double meanMotion)?  $default,) {final _that = this;
switch (_that) {
case _Tle() when $default != null:
return $default(_that.name,_that.line1,_that.line2,_that.noradCatId,_that.intlDesignator,_that.epochYear,_that.inclination,_that.raan,_that.eccentricity,_that.argumentOfPerigee,_that.meanAnomaly,_that.meanMotion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tle implements Tle {
  const _Tle({required this.name, required this.line1, required this.line2, required this.noradCatId, required this.intlDesignator, required this.epochYear, required this.inclination, required this.raan, required this.eccentricity, required this.argumentOfPerigee, required this.meanAnomaly, required this.meanMotion});
  factory _Tle.fromJson(Map<String, dynamic> json) => _$TleFromJson(json);

@override final  String name;
@override final  String line1;
@override final  String line2;
@override final  int noradCatId;
@override final  String intlDesignator;
@override final  double epochYear;
@override final  double inclination;
@override final  double raan;
@override final  double eccentricity;
@override final  double argumentOfPerigee;
@override final  double meanAnomaly;
@override final  double meanMotion;

/// Create a copy of Tle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TleCopyWith<_Tle> get copyWith => __$TleCopyWithImpl<_Tle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tle&&(identical(other.name, name) || other.name == name)&&(identical(other.line1, line1) || other.line1 == line1)&&(identical(other.line2, line2) || other.line2 == line2)&&(identical(other.noradCatId, noradCatId) || other.noradCatId == noradCatId)&&(identical(other.intlDesignator, intlDesignator) || other.intlDesignator == intlDesignator)&&(identical(other.epochYear, epochYear) || other.epochYear == epochYear)&&(identical(other.inclination, inclination) || other.inclination == inclination)&&(identical(other.raan, raan) || other.raan == raan)&&(identical(other.eccentricity, eccentricity) || other.eccentricity == eccentricity)&&(identical(other.argumentOfPerigee, argumentOfPerigee) || other.argumentOfPerigee == argumentOfPerigee)&&(identical(other.meanAnomaly, meanAnomaly) || other.meanAnomaly == meanAnomaly)&&(identical(other.meanMotion, meanMotion) || other.meanMotion == meanMotion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,line1,line2,noradCatId,intlDesignator,epochYear,inclination,raan,eccentricity,argumentOfPerigee,meanAnomaly,meanMotion);

@override
String toString() {
  return 'Tle(name: $name, line1: $line1, line2: $line2, noradCatId: $noradCatId, intlDesignator: $intlDesignator, epochYear: $epochYear, inclination: $inclination, raan: $raan, eccentricity: $eccentricity, argumentOfPerigee: $argumentOfPerigee, meanAnomaly: $meanAnomaly, meanMotion: $meanMotion)';
}


}

/// @nodoc
abstract mixin class _$TleCopyWith<$Res> implements $TleCopyWith<$Res> {
  factory _$TleCopyWith(_Tle value, $Res Function(_Tle) _then) = __$TleCopyWithImpl;
@override @useResult
$Res call({
 String name, String line1, String line2, int noradCatId, String intlDesignator, double epochYear, double inclination, double raan, double eccentricity, double argumentOfPerigee, double meanAnomaly, double meanMotion
});




}
/// @nodoc
class __$TleCopyWithImpl<$Res>
    implements _$TleCopyWith<$Res> {
  __$TleCopyWithImpl(this._self, this._then);

  final _Tle _self;
  final $Res Function(_Tle) _then;

/// Create a copy of Tle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? line1 = null,Object? line2 = null,Object? noradCatId = null,Object? intlDesignator = null,Object? epochYear = null,Object? inclination = null,Object? raan = null,Object? eccentricity = null,Object? argumentOfPerigee = null,Object? meanAnomaly = null,Object? meanMotion = null,}) {
  return _then(_Tle(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: null == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String,noradCatId: null == noradCatId ? _self.noradCatId : noradCatId // ignore: cast_nullable_to_non_nullable
as int,intlDesignator: null == intlDesignator ? _self.intlDesignator : intlDesignator // ignore: cast_nullable_to_non_nullable
as String,epochYear: null == epochYear ? _self.epochYear : epochYear // ignore: cast_nullable_to_non_nullable
as double,inclination: null == inclination ? _self.inclination : inclination // ignore: cast_nullable_to_non_nullable
as double,raan: null == raan ? _self.raan : raan // ignore: cast_nullable_to_non_nullable
as double,eccentricity: null == eccentricity ? _self.eccentricity : eccentricity // ignore: cast_nullable_to_non_nullable
as double,argumentOfPerigee: null == argumentOfPerigee ? _self.argumentOfPerigee : argumentOfPerigee // ignore: cast_nullable_to_non_nullable
as double,meanAnomaly: null == meanAnomaly ? _self.meanAnomaly : meanAnomaly // ignore: cast_nullable_to_non_nullable
as double,meanMotion: null == meanMotion ? _self.meanMotion : meanMotion // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
