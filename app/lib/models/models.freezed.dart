// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vacancy {

 String get id; String get title;@JsonKey(name: 'salary_from') int? get salaryFrom;@JsonKey(name: 'salary_to') int? get salaryTo; String? get currency; String? get employment; bool? get remote; String? get location; String get url;@JsonKey(name: 'published_at') String? get publishedAt; String? get description; String get source;@JsonKey(name: 'company_name') String? get companyName;@JsonKey(name: 'company_inn') String? get companyInn;
/// Create a copy of Vacancy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VacancyCopyWith<Vacancy> get copyWith => _$VacancyCopyWithImpl<Vacancy>(this as Vacancy, _$identity);

  /// Serializes this Vacancy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vacancy&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.employment, employment) || other.employment == employment)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.location, location) || other.location == location)&&(identical(other.url, url) || other.url == url)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyInn, companyInn) || other.companyInn == companyInn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,salaryFrom,salaryTo,currency,employment,remote,location,url,publishedAt,description,source,companyName,companyInn);

@override
String toString() {
  return 'Vacancy(id: $id, title: $title, salaryFrom: $salaryFrom, salaryTo: $salaryTo, currency: $currency, employment: $employment, remote: $remote, location: $location, url: $url, publishedAt: $publishedAt, description: $description, source: $source, companyName: $companyName, companyInn: $companyInn)';
}


}

/// @nodoc
abstract mixin class $VacancyCopyWith<$Res>  {
  factory $VacancyCopyWith(Vacancy value, $Res Function(Vacancy) _then) = _$VacancyCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? currency, String? employment, bool? remote, String? location, String url,@JsonKey(name: 'published_at') String? publishedAt, String? description, String source,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'company_inn') String? companyInn
});




}
/// @nodoc
class _$VacancyCopyWithImpl<$Res>
    implements $VacancyCopyWith<$Res> {
  _$VacancyCopyWithImpl(this._self, this._then);

  final Vacancy _self;
  final $Res Function(Vacancy) _then;

/// Create a copy of Vacancy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? currency = freezed,Object? employment = freezed,Object? remote = freezed,Object? location = freezed,Object? url = null,Object? publishedAt = freezed,Object? description = freezed,Object? source = null,Object? companyName = freezed,Object? companyInn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as bool?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyInn: freezed == companyInn ? _self.companyInn : companyInn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Vacancy].
extension VacancyPatterns on Vacancy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vacancy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vacancy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vacancy value)  $default,){
final _that = this;
switch (_that) {
case _Vacancy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vacancy value)?  $default,){
final _that = this;
switch (_that) {
case _Vacancy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? currency,  String? employment,  bool? remote,  String? location,  String url, @JsonKey(name: 'published_at')  String? publishedAt,  String? description,  String source, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vacancy() when $default != null:
return $default(_that.id,_that.title,_that.salaryFrom,_that.salaryTo,_that.currency,_that.employment,_that.remote,_that.location,_that.url,_that.publishedAt,_that.description,_that.source,_that.companyName,_that.companyInn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? currency,  String? employment,  bool? remote,  String? location,  String url, @JsonKey(name: 'published_at')  String? publishedAt,  String? description,  String source, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn)  $default,) {final _that = this;
switch (_that) {
case _Vacancy():
return $default(_that.id,_that.title,_that.salaryFrom,_that.salaryTo,_that.currency,_that.employment,_that.remote,_that.location,_that.url,_that.publishedAt,_that.description,_that.source,_that.companyName,_that.companyInn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? currency,  String? employment,  bool? remote,  String? location,  String url, @JsonKey(name: 'published_at')  String? publishedAt,  String? description,  String source, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn)?  $default,) {final _that = this;
switch (_that) {
case _Vacancy() when $default != null:
return $default(_that.id,_that.title,_that.salaryFrom,_that.salaryTo,_that.currency,_that.employment,_that.remote,_that.location,_that.url,_that.publishedAt,_that.description,_that.source,_that.companyName,_that.companyInn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vacancy implements Vacancy {
  const _Vacancy({required this.id, required this.title, @JsonKey(name: 'salary_from') this.salaryFrom, @JsonKey(name: 'salary_to') this.salaryTo, this.currency, this.employment, this.remote, this.location, required this.url, @JsonKey(name: 'published_at') this.publishedAt, this.description, required this.source, @JsonKey(name: 'company_name') this.companyName, @JsonKey(name: 'company_inn') this.companyInn});
  factory _Vacancy.fromJson(Map<String, dynamic> json) => _$VacancyFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'salary_from') final  int? salaryFrom;
@override@JsonKey(name: 'salary_to') final  int? salaryTo;
@override final  String? currency;
@override final  String? employment;
@override final  bool? remote;
@override final  String? location;
@override final  String url;
@override@JsonKey(name: 'published_at') final  String? publishedAt;
@override final  String? description;
@override final  String source;
@override@JsonKey(name: 'company_name') final  String? companyName;
@override@JsonKey(name: 'company_inn') final  String? companyInn;

/// Create a copy of Vacancy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VacancyCopyWith<_Vacancy> get copyWith => __$VacancyCopyWithImpl<_Vacancy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VacancyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vacancy&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.employment, employment) || other.employment == employment)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.location, location) || other.location == location)&&(identical(other.url, url) || other.url == url)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyInn, companyInn) || other.companyInn == companyInn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,salaryFrom,salaryTo,currency,employment,remote,location,url,publishedAt,description,source,companyName,companyInn);

@override
String toString() {
  return 'Vacancy(id: $id, title: $title, salaryFrom: $salaryFrom, salaryTo: $salaryTo, currency: $currency, employment: $employment, remote: $remote, location: $location, url: $url, publishedAt: $publishedAt, description: $description, source: $source, companyName: $companyName, companyInn: $companyInn)';
}


}

/// @nodoc
abstract mixin class _$VacancyCopyWith<$Res> implements $VacancyCopyWith<$Res> {
  factory _$VacancyCopyWith(_Vacancy value, $Res Function(_Vacancy) _then) = __$VacancyCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? currency, String? employment, bool? remote, String? location, String url,@JsonKey(name: 'published_at') String? publishedAt, String? description, String source,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'company_inn') String? companyInn
});




}
/// @nodoc
class __$VacancyCopyWithImpl<$Res>
    implements _$VacancyCopyWith<$Res> {
  __$VacancyCopyWithImpl(this._self, this._then);

  final _Vacancy _self;
  final $Res Function(_Vacancy) _then;

/// Create a copy of Vacancy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? currency = freezed,Object? employment = freezed,Object? remote = freezed,Object? location = freezed,Object? url = null,Object? publishedAt = freezed,Object? description = freezed,Object? source = null,Object? companyName = freezed,Object? companyInn = freezed,}) {
  return _then(_Vacancy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as bool?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyInn: freezed == companyInn ? _self.companyInn : companyInn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FinanceYear {

 int get year; int? get revenue; int? get profit;
/// Create a copy of FinanceYear
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinanceYearCopyWith<FinanceYear> get copyWith => _$FinanceYearCopyWithImpl<FinanceYear>(this as FinanceYear, _$identity);

  /// Serializes this FinanceYear to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinanceYear&&(identical(other.year, year) || other.year == year)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,revenue,profit);

@override
String toString() {
  return 'FinanceYear(year: $year, revenue: $revenue, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $FinanceYearCopyWith<$Res>  {
  factory $FinanceYearCopyWith(FinanceYear value, $Res Function(FinanceYear) _then) = _$FinanceYearCopyWithImpl;
@useResult
$Res call({
 int year, int? revenue, int? profit
});




}
/// @nodoc
class _$FinanceYearCopyWithImpl<$Res>
    implements $FinanceYearCopyWith<$Res> {
  _$FinanceYearCopyWithImpl(this._self, this._then);

  final FinanceYear _self;
  final $Res Function(FinanceYear) _then;

/// Create a copy of FinanceYear
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? year = null,Object? revenue = freezed,Object? profit = freezed,}) {
  return _then(_self.copyWith(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,revenue: freezed == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int?,profit: freezed == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FinanceYear].
extension FinanceYearPatterns on FinanceYear {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinanceYear value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinanceYear() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinanceYear value)  $default,){
final _that = this;
switch (_that) {
case _FinanceYear():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinanceYear value)?  $default,){
final _that = this;
switch (_that) {
case _FinanceYear() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int year,  int? revenue,  int? profit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinanceYear() when $default != null:
return $default(_that.year,_that.revenue,_that.profit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int year,  int? revenue,  int? profit)  $default,) {final _that = this;
switch (_that) {
case _FinanceYear():
return $default(_that.year,_that.revenue,_that.profit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int year,  int? revenue,  int? profit)?  $default,) {final _that = this;
switch (_that) {
case _FinanceYear() when $default != null:
return $default(_that.year,_that.revenue,_that.profit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinanceYear implements FinanceYear {
  const _FinanceYear({required this.year, this.revenue, this.profit});
  factory _FinanceYear.fromJson(Map<String, dynamic> json) => _$FinanceYearFromJson(json);

@override final  int year;
@override final  int? revenue;
@override final  int? profit;

/// Create a copy of FinanceYear
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinanceYearCopyWith<_FinanceYear> get copyWith => __$FinanceYearCopyWithImpl<_FinanceYear>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinanceYearToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinanceYear&&(identical(other.year, year) || other.year == year)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.profit, profit) || other.profit == profit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,year,revenue,profit);

@override
String toString() {
  return 'FinanceYear(year: $year, revenue: $revenue, profit: $profit)';
}


}

/// @nodoc
abstract mixin class _$FinanceYearCopyWith<$Res> implements $FinanceYearCopyWith<$Res> {
  factory _$FinanceYearCopyWith(_FinanceYear value, $Res Function(_FinanceYear) _then) = __$FinanceYearCopyWithImpl;
@override @useResult
$Res call({
 int year, int? revenue, int? profit
});




}
/// @nodoc
class __$FinanceYearCopyWithImpl<$Res>
    implements _$FinanceYearCopyWith<$Res> {
  __$FinanceYearCopyWithImpl(this._self, this._then);

  final _FinanceYear _self;
  final $Res Function(_FinanceYear) _then;

/// Create a copy of FinanceYear
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? year = null,Object? revenue = freezed,Object? profit = freezed,}) {
  return _then(_FinanceYear(
year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,revenue: freezed == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int?,profit: freezed == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Company {

@JsonKey(name: 'legal_name') String? get legalName; String? get inn; String? get ogrn;@JsonKey(name: 'registered_at') String? get registeredAt; String? get okved; String? get address; String? get status; String? get site; List<FinanceYear> get finance;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.legalName, legalName) || other.legalName == legalName)&&(identical(other.inn, inn) || other.inn == inn)&&(identical(other.ogrn, ogrn) || other.ogrn == ogrn)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.okved, okved) || other.okved == okved)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other.finance, finance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,legalName,inn,ogrn,registeredAt,okved,address,status,site,const DeepCollectionEquality().hash(finance));

@override
String toString() {
  return 'Company(legalName: $legalName, inn: $inn, ogrn: $ogrn, registeredAt: $registeredAt, okved: $okved, address: $address, status: $status, site: $site, finance: $finance)';
}


}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'legal_name') String? legalName, String? inn, String? ogrn,@JsonKey(name: 'registered_at') String? registeredAt, String? okved, String? address, String? status, String? site, List<FinanceYear> finance
});




}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? legalName = freezed,Object? inn = freezed,Object? ogrn = freezed,Object? registeredAt = freezed,Object? okved = freezed,Object? address = freezed,Object? status = freezed,Object? site = freezed,Object? finance = null,}) {
  return _then(_self.copyWith(
legalName: freezed == legalName ? _self.legalName : legalName // ignore: cast_nullable_to_non_nullable
as String?,inn: freezed == inn ? _self.inn : inn // ignore: cast_nullable_to_non_nullable
as String?,ogrn: freezed == ogrn ? _self.ogrn : ogrn // ignore: cast_nullable_to_non_nullable
as String?,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as String?,okved: freezed == okved ? _self.okved : okved // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,finance: null == finance ? _self.finance : finance // ignore: cast_nullable_to_non_nullable
as List<FinanceYear>,
  ));
}

}


/// Adds pattern-matching-related methods to [Company].
extension CompanyPatterns on Company {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Company value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Company value)  $default,){
final _that = this;
switch (_that) {
case _Company():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Company value)?  $default,){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'legal_name')  String? legalName,  String? inn,  String? ogrn, @JsonKey(name: 'registered_at')  String? registeredAt,  String? okved,  String? address,  String? status,  String? site,  List<FinanceYear> finance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.legalName,_that.inn,_that.ogrn,_that.registeredAt,_that.okved,_that.address,_that.status,_that.site,_that.finance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'legal_name')  String? legalName,  String? inn,  String? ogrn, @JsonKey(name: 'registered_at')  String? registeredAt,  String? okved,  String? address,  String? status,  String? site,  List<FinanceYear> finance)  $default,) {final _that = this;
switch (_that) {
case _Company():
return $default(_that.legalName,_that.inn,_that.ogrn,_that.registeredAt,_that.okved,_that.address,_that.status,_that.site,_that.finance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'legal_name')  String? legalName,  String? inn,  String? ogrn, @JsonKey(name: 'registered_at')  String? registeredAt,  String? okved,  String? address,  String? status,  String? site,  List<FinanceYear> finance)?  $default,) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.legalName,_that.inn,_that.ogrn,_that.registeredAt,_that.okved,_that.address,_that.status,_that.site,_that.finance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Company implements Company {
  const _Company({@JsonKey(name: 'legal_name') this.legalName, this.inn, this.ogrn, @JsonKey(name: 'registered_at') this.registeredAt, this.okved, this.address, this.status, this.site, final  List<FinanceYear> finance = const <FinanceYear>[]}): _finance = finance;
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

@override@JsonKey(name: 'legal_name') final  String? legalName;
@override final  String? inn;
@override final  String? ogrn;
@override@JsonKey(name: 'registered_at') final  String? registeredAt;
@override final  String? okved;
@override final  String? address;
@override final  String? status;
@override final  String? site;
 final  List<FinanceYear> _finance;
@override@JsonKey() List<FinanceYear> get finance {
  if (_finance is EqualUnmodifiableListView) return _finance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_finance);
}


/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.legalName, legalName) || other.legalName == legalName)&&(identical(other.inn, inn) || other.inn == inn)&&(identical(other.ogrn, ogrn) || other.ogrn == ogrn)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.okved, okved) || other.okved == okved)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.site, site) || other.site == site)&&const DeepCollectionEquality().equals(other._finance, _finance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,legalName,inn,ogrn,registeredAt,okved,address,status,site,const DeepCollectionEquality().hash(_finance));

@override
String toString() {
  return 'Company(legalName: $legalName, inn: $inn, ogrn: $ogrn, registeredAt: $registeredAt, okved: $okved, address: $address, status: $status, site: $site, finance: $finance)';
}


}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'legal_name') String? legalName, String? inn, String? ogrn,@JsonKey(name: 'registered_at') String? registeredAt, String? okved, String? address, String? status, String? site, List<FinanceYear> finance
});




}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? legalName = freezed,Object? inn = freezed,Object? ogrn = freezed,Object? registeredAt = freezed,Object? okved = freezed,Object? address = freezed,Object? status = freezed,Object? site = freezed,Object? finance = null,}) {
  return _then(_Company(
legalName: freezed == legalName ? _self.legalName : legalName // ignore: cast_nullable_to_non_nullable
as String?,inn: freezed == inn ? _self.inn : inn // ignore: cast_nullable_to_non_nullable
as String?,ogrn: freezed == ogrn ? _self.ogrn : ogrn // ignore: cast_nullable_to_non_nullable
as String?,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as String?,okved: freezed == okved ? _self.okved : okved // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,site: freezed == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String?,finance: null == finance ? _self._finance : finance // ignore: cast_nullable_to_non_nullable
as List<FinanceYear>,
  ));
}


}


/// @nodoc
mixin _$Contact {

 String? get email;@JsonKey(name: 'email_is_role') bool? get emailIsRole; String? get phone;@JsonKey(name: 'phone_region') String? get phoneRegion;@JsonKey(name: 'phone_timezone') String? get phoneTimezone; String? get telegram; String? get page;
/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactCopyWith<Contact> get copyWith => _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contact&&(identical(other.email, email) || other.email == email)&&(identical(other.emailIsRole, emailIsRole) || other.emailIsRole == emailIsRole)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneRegion, phoneRegion) || other.phoneRegion == phoneRegion)&&(identical(other.phoneTimezone, phoneTimezone) || other.phoneTimezone == phoneTimezone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,emailIsRole,phone,phoneRegion,phoneTimezone,telegram,page);

@override
String toString() {
  return 'Contact(email: $email, emailIsRole: $emailIsRole, phone: $phone, phoneRegion: $phoneRegion, phoneTimezone: $phoneTimezone, telegram: $telegram, page: $page)';
}


}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res>  {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) = _$ContactCopyWithImpl;
@useResult
$Res call({
 String? email,@JsonKey(name: 'email_is_role') bool? emailIsRole, String? phone,@JsonKey(name: 'phone_region') String? phoneRegion,@JsonKey(name: 'phone_timezone') String? phoneTimezone, String? telegram, String? page
});




}
/// @nodoc
class _$ContactCopyWithImpl<$Res>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._self, this._then);

  final Contact _self;
  final $Res Function(Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? emailIsRole = freezed,Object? phone = freezed,Object? phoneRegion = freezed,Object? phoneTimezone = freezed,Object? telegram = freezed,Object? page = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailIsRole: freezed == emailIsRole ? _self.emailIsRole : emailIsRole // ignore: cast_nullable_to_non_nullable
as bool?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,phoneRegion: freezed == phoneRegion ? _self.phoneRegion : phoneRegion // ignore: cast_nullable_to_non_nullable
as String?,phoneTimezone: freezed == phoneTimezone ? _self.phoneTimezone : phoneTimezone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Contact].
extension ContactPatterns on Contact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Contact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Contact value)  $default,){
final _that = this;
switch (_that) {
case _Contact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Contact value)?  $default,){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email, @JsonKey(name: 'email_is_role')  bool? emailIsRole,  String? phone, @JsonKey(name: 'phone_region')  String? phoneRegion, @JsonKey(name: 'phone_timezone')  String? phoneTimezone,  String? telegram,  String? page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.email,_that.emailIsRole,_that.phone,_that.phoneRegion,_that.phoneTimezone,_that.telegram,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email, @JsonKey(name: 'email_is_role')  bool? emailIsRole,  String? phone, @JsonKey(name: 'phone_region')  String? phoneRegion, @JsonKey(name: 'phone_timezone')  String? phoneTimezone,  String? telegram,  String? page)  $default,) {final _that = this;
switch (_that) {
case _Contact():
return $default(_that.email,_that.emailIsRole,_that.phone,_that.phoneRegion,_that.phoneTimezone,_that.telegram,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email, @JsonKey(name: 'email_is_role')  bool? emailIsRole,  String? phone, @JsonKey(name: 'phone_region')  String? phoneRegion, @JsonKey(name: 'phone_timezone')  String? phoneTimezone,  String? telegram,  String? page)?  $default,) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.email,_that.emailIsRole,_that.phone,_that.phoneRegion,_that.phoneTimezone,_that.telegram,_that.page);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Contact implements Contact {
  const _Contact({this.email, @JsonKey(name: 'email_is_role') this.emailIsRole, this.phone, @JsonKey(name: 'phone_region') this.phoneRegion, @JsonKey(name: 'phone_timezone') this.phoneTimezone, this.telegram, this.page});
  factory _Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

@override final  String? email;
@override@JsonKey(name: 'email_is_role') final  bool? emailIsRole;
@override final  String? phone;
@override@JsonKey(name: 'phone_region') final  String? phoneRegion;
@override@JsonKey(name: 'phone_timezone') final  String? phoneTimezone;
@override final  String? telegram;
@override final  String? page;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactCopyWith<_Contact> get copyWith => __$ContactCopyWithImpl<_Contact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contact&&(identical(other.email, email) || other.email == email)&&(identical(other.emailIsRole, emailIsRole) || other.emailIsRole == emailIsRole)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneRegion, phoneRegion) || other.phoneRegion == phoneRegion)&&(identical(other.phoneTimezone, phoneTimezone) || other.phoneTimezone == phoneTimezone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.page, page) || other.page == page));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,emailIsRole,phone,phoneRegion,phoneTimezone,telegram,page);

@override
String toString() {
  return 'Contact(email: $email, emailIsRole: $emailIsRole, phone: $phone, phoneRegion: $phoneRegion, phoneTimezone: $phoneTimezone, telegram: $telegram, page: $page)';
}


}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) = __$ContactCopyWithImpl;
@override @useResult
$Res call({
 String? email,@JsonKey(name: 'email_is_role') bool? emailIsRole, String? phone,@JsonKey(name: 'phone_region') String? phoneRegion,@JsonKey(name: 'phone_timezone') String? phoneTimezone, String? telegram, String? page
});




}
/// @nodoc
class __$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(this._self, this._then);

  final _Contact _self;
  final $Res Function(_Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? emailIsRole = freezed,Object? phone = freezed,Object? phoneRegion = freezed,Object? phoneTimezone = freezed,Object? telegram = freezed,Object? page = freezed,}) {
  return _then(_Contact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailIsRole: freezed == emailIsRole ? _self.emailIsRole : emailIsRole // ignore: cast_nullable_to_non_nullable
as bool?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,phoneRegion: freezed == phoneRegion ? _self.phoneRegion : phoneRegion // ignore: cast_nullable_to_non_nullable
as String?,phoneTimezone: freezed == phoneTimezone ? _self.phoneTimezone : phoneTimezone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Signal {

 String get text; String get url; String? get date;
/// Create a copy of Signal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignalCopyWith<Signal> get copyWith => _$SignalCopyWithImpl<Signal>(this as Signal, _$identity);

  /// Serializes this Signal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Signal&&(identical(other.text, text) || other.text == text)&&(identical(other.url, url) || other.url == url)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,url,date);

@override
String toString() {
  return 'Signal(text: $text, url: $url, date: $date)';
}


}

/// @nodoc
abstract mixin class $SignalCopyWith<$Res>  {
  factory $SignalCopyWith(Signal value, $Res Function(Signal) _then) = _$SignalCopyWithImpl;
@useResult
$Res call({
 String text, String url, String? date
});




}
/// @nodoc
class _$SignalCopyWithImpl<$Res>
    implements $SignalCopyWith<$Res> {
  _$SignalCopyWithImpl(this._self, this._then);

  final Signal _self;
  final $Res Function(Signal) _then;

/// Create a copy of Signal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? url = null,Object? date = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Signal].
extension SignalPatterns on Signal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Signal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Signal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Signal value)  $default,){
final _that = this;
switch (_that) {
case _Signal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Signal value)?  $default,){
final _that = this;
switch (_that) {
case _Signal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String url,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Signal() when $default != null:
return $default(_that.text,_that.url,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String url,  String? date)  $default,) {final _that = this;
switch (_that) {
case _Signal():
return $default(_that.text,_that.url,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String url,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _Signal() when $default != null:
return $default(_that.text,_that.url,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Signal implements Signal {
  const _Signal({required this.text, required this.url, this.date});
  factory _Signal.fromJson(Map<String, dynamic> json) => _$SignalFromJson(json);

@override final  String text;
@override final  String url;
@override final  String? date;

/// Create a copy of Signal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignalCopyWith<_Signal> get copyWith => __$SignalCopyWithImpl<_Signal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Signal&&(identical(other.text, text) || other.text == text)&&(identical(other.url, url) || other.url == url)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,url,date);

@override
String toString() {
  return 'Signal(text: $text, url: $url, date: $date)';
}


}

/// @nodoc
abstract mixin class _$SignalCopyWith<$Res> implements $SignalCopyWith<$Res> {
  factory _$SignalCopyWith(_Signal value, $Res Function(_Signal) _then) = __$SignalCopyWithImpl;
@override @useResult
$Res call({
 String text, String url, String? date
});




}
/// @nodoc
class __$SignalCopyWithImpl<$Res>
    implements _$SignalCopyWith<$Res> {
  __$SignalCopyWithImpl(this._self, this._then);

  final _Signal _self;
  final $Res Function(_Signal) _then;

/// Create a copy of Signal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? url = null,Object? date = freezed,}) {
  return _then(_Signal(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Owner {

@JsonKey(name: 'full_name') String? get fullName; String? get gender; String? get role; String? get source; Contact? get contacts; List<Signal> get signals;
/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerCopyWith<Owner> get copyWith => _$OwnerCopyWithImpl<Owner>(this as Owner, _$identity);

  /// Serializes this Owner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Owner&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.role, role) || other.role == role)&&(identical(other.source, source) || other.source == source)&&(identical(other.contacts, contacts) || other.contacts == contacts)&&const DeepCollectionEquality().equals(other.signals, signals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,gender,role,source,contacts,const DeepCollectionEquality().hash(signals));

@override
String toString() {
  return 'Owner(fullName: $fullName, gender: $gender, role: $role, source: $source, contacts: $contacts, signals: $signals)';
}


}

/// @nodoc
abstract mixin class $OwnerCopyWith<$Res>  {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) _then) = _$OwnerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName, String? gender, String? role, String? source, Contact? contacts, List<Signal> signals
});


$ContactCopyWith<$Res>? get contacts;

}
/// @nodoc
class _$OwnerCopyWithImpl<$Res>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._self, this._then);

  final Owner _self;
  final $Res Function(Owner) _then;

/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? gender = freezed,Object? role = freezed,Object? source = freezed,Object? contacts = freezed,Object? signals = null,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,contacts: freezed == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as Contact?,signals: null == signals ? _self.signals : signals // ignore: cast_nullable_to_non_nullable
as List<Signal>,
  ));
}
/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res>? get contacts {
    if (_self.contacts == null) {
    return null;
  }

  return $ContactCopyWith<$Res>(_self.contacts!, (value) {
    return _then(_self.copyWith(contacts: value));
  });
}
}


/// Adds pattern-matching-related methods to [Owner].
extension OwnerPatterns on Owner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Owner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Owner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Owner value)  $default,){
final _that = this;
switch (_that) {
case _Owner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Owner value)?  $default,){
final _that = this;
switch (_that) {
case _Owner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName,  String? gender,  String? role,  String? source,  Contact? contacts,  List<Signal> signals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Owner() when $default != null:
return $default(_that.fullName,_that.gender,_that.role,_that.source,_that.contacts,_that.signals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName,  String? gender,  String? role,  String? source,  Contact? contacts,  List<Signal> signals)  $default,) {final _that = this;
switch (_that) {
case _Owner():
return $default(_that.fullName,_that.gender,_that.role,_that.source,_that.contacts,_that.signals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String? fullName,  String? gender,  String? role,  String? source,  Contact? contacts,  List<Signal> signals)?  $default,) {final _that = this;
switch (_that) {
case _Owner() when $default != null:
return $default(_that.fullName,_that.gender,_that.role,_that.source,_that.contacts,_that.signals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Owner implements Owner {
  const _Owner({@JsonKey(name: 'full_name') this.fullName, this.gender, this.role, this.source, this.contacts, final  List<Signal> signals = const <Signal>[]}): _signals = signals;
  factory _Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

@override@JsonKey(name: 'full_name') final  String? fullName;
@override final  String? gender;
@override final  String? role;
@override final  String? source;
@override final  Contact? contacts;
 final  List<Signal> _signals;
@override@JsonKey() List<Signal> get signals {
  if (_signals is EqualUnmodifiableListView) return _signals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_signals);
}


/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerCopyWith<_Owner> get copyWith => __$OwnerCopyWithImpl<_Owner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Owner&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.role, role) || other.role == role)&&(identical(other.source, source) || other.source == source)&&(identical(other.contacts, contacts) || other.contacts == contacts)&&const DeepCollectionEquality().equals(other._signals, _signals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,gender,role,source,contacts,const DeepCollectionEquality().hash(_signals));

@override
String toString() {
  return 'Owner(fullName: $fullName, gender: $gender, role: $role, source: $source, contacts: $contacts, signals: $signals)';
}


}

/// @nodoc
abstract mixin class _$OwnerCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$OwnerCopyWith(_Owner value, $Res Function(_Owner) _then) = __$OwnerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName, String? gender, String? role, String? source, Contact? contacts, List<Signal> signals
});


@override $ContactCopyWith<$Res>? get contacts;

}
/// @nodoc
class __$OwnerCopyWithImpl<$Res>
    implements _$OwnerCopyWith<$Res> {
  __$OwnerCopyWithImpl(this._self, this._then);

  final _Owner _self;
  final $Res Function(_Owner) _then;

/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? gender = freezed,Object? role = freezed,Object? source = freezed,Object? contacts = freezed,Object? signals = null,}) {
  return _then(_Owner(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,contacts: freezed == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as Contact?,signals: null == signals ? _self._signals : signals // ignore: cast_nullable_to_non_nullable
as List<Signal>,
  ));
}

/// Create a copy of Owner
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res>? get contacts {
    if (_self.contacts == null) {
    return null;
  }

  return $ContactCopyWith<$Res>(_self.contacts!, (value) {
    return _then(_self.copyWith(contacts: value));
  });
}
}


/// @nodoc
mixin _$Review {

 String get source; double? get rating; int? get count; String? get summary; String? get url;
/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCopyWith<Review> get copyWith => _$ReviewCopyWithImpl<Review>(this as Review, _$identity);

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Review&&(identical(other.source, source) || other.source == source)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.count, count) || other.count == count)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,rating,count,summary,url);

@override
String toString() {
  return 'Review(source: $source, rating: $rating, count: $count, summary: $summary, url: $url)';
}


}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res>  {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) = _$ReviewCopyWithImpl;
@useResult
$Res call({
 String source, double? rating, int? count, String? summary, String? url
});




}
/// @nodoc
class _$ReviewCopyWithImpl<$Res>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? rating = freezed,Object? count = freezed,Object? summary = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Review].
extension ReviewPatterns on Review {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Review value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Review value)  $default,){
final _that = this;
switch (_that) {
case _Review():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Review value)?  $default,){
final _that = this;
switch (_that) {
case _Review() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  double? rating,  int? count,  String? summary,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.source,_that.rating,_that.count,_that.summary,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  double? rating,  int? count,  String? summary,  String? url)  $default,) {final _that = this;
switch (_that) {
case _Review():
return $default(_that.source,_that.rating,_that.count,_that.summary,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  double? rating,  int? count,  String? summary,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.source,_that.rating,_that.count,_that.summary,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Review implements Review {
  const _Review({required this.source, this.rating, this.count, this.summary, this.url});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

@override final  String source;
@override final  double? rating;
@override final  int? count;
@override final  String? summary;
@override final  String? url;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.source, source) || other.source == source)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.count, count) || other.count == count)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,rating,count,summary,url);

@override
String toString() {
  return 'Review(source: $source, rating: $rating, count: $count, summary: $summary, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@override @useResult
$Res call({
 String source, double? rating, int? count, String? summary, String? url
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? rating = freezed,Object? count = freezed,Object? summary = freezed,Object? url = freezed,}) {
  return _then(_Review(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LetterFact {

 String get claim;@JsonKey(name: 'source_url') String get sourceUrl;
/// Create a copy of LetterFact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterFactCopyWith<LetterFact> get copyWith => _$LetterFactCopyWithImpl<LetterFact>(this as LetterFact, _$identity);

  /// Serializes this LetterFact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LetterFact&&(identical(other.claim, claim) || other.claim == claim)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,claim,sourceUrl);

@override
String toString() {
  return 'LetterFact(claim: $claim, sourceUrl: $sourceUrl)';
}


}

/// @nodoc
abstract mixin class $LetterFactCopyWith<$Res>  {
  factory $LetterFactCopyWith(LetterFact value, $Res Function(LetterFact) _then) = _$LetterFactCopyWithImpl;
@useResult
$Res call({
 String claim,@JsonKey(name: 'source_url') String sourceUrl
});




}
/// @nodoc
class _$LetterFactCopyWithImpl<$Res>
    implements $LetterFactCopyWith<$Res> {
  _$LetterFactCopyWithImpl(this._self, this._then);

  final LetterFact _self;
  final $Res Function(LetterFact) _then;

/// Create a copy of LetterFact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? claim = null,Object? sourceUrl = null,}) {
  return _then(_self.copyWith(
claim: null == claim ? _self.claim : claim // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LetterFact].
extension LetterFactPatterns on LetterFact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LetterFact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LetterFact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LetterFact value)  $default,){
final _that = this;
switch (_that) {
case _LetterFact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LetterFact value)?  $default,){
final _that = this;
switch (_that) {
case _LetterFact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String claim, @JsonKey(name: 'source_url')  String sourceUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LetterFact() when $default != null:
return $default(_that.claim,_that.sourceUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String claim, @JsonKey(name: 'source_url')  String sourceUrl)  $default,) {final _that = this;
switch (_that) {
case _LetterFact():
return $default(_that.claim,_that.sourceUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String claim, @JsonKey(name: 'source_url')  String sourceUrl)?  $default,) {final _that = this;
switch (_that) {
case _LetterFact() when $default != null:
return $default(_that.claim,_that.sourceUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LetterFact implements LetterFact {
  const _LetterFact({required this.claim, @JsonKey(name: 'source_url') required this.sourceUrl});
  factory _LetterFact.fromJson(Map<String, dynamic> json) => _$LetterFactFromJson(json);

@override final  String claim;
@override@JsonKey(name: 'source_url') final  String sourceUrl;

/// Create a copy of LetterFact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterFactCopyWith<_LetterFact> get copyWith => __$LetterFactCopyWithImpl<_LetterFact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LetterFactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LetterFact&&(identical(other.claim, claim) || other.claim == claim)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,claim,sourceUrl);

@override
String toString() {
  return 'LetterFact(claim: $claim, sourceUrl: $sourceUrl)';
}


}

/// @nodoc
abstract mixin class _$LetterFactCopyWith<$Res> implements $LetterFactCopyWith<$Res> {
  factory _$LetterFactCopyWith(_LetterFact value, $Res Function(_LetterFact) _then) = __$LetterFactCopyWithImpl;
@override @useResult
$Res call({
 String claim,@JsonKey(name: 'source_url') String sourceUrl
});




}
/// @nodoc
class __$LetterFactCopyWithImpl<$Res>
    implements _$LetterFactCopyWith<$Res> {
  __$LetterFactCopyWithImpl(this._self, this._then);

  final _LetterFact _self;
  final $Res Function(_LetterFact) _then;

/// Create a copy of LetterFact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? claim = null,Object? sourceUrl = null,}) {
  return _then(_LetterFact(
claim: null == claim ? _self.claim : claim // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: null == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Letter {

 String get text; List<LetterFact> get facts;
/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LetterCopyWith<Letter> get copyWith => _$LetterCopyWithImpl<Letter>(this as Letter, _$identity);

  /// Serializes this Letter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Letter&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.facts, facts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(facts));

@override
String toString() {
  return 'Letter(text: $text, facts: $facts)';
}


}

/// @nodoc
abstract mixin class $LetterCopyWith<$Res>  {
  factory $LetterCopyWith(Letter value, $Res Function(Letter) _then) = _$LetterCopyWithImpl;
@useResult
$Res call({
 String text, List<LetterFact> facts
});




}
/// @nodoc
class _$LetterCopyWithImpl<$Res>
    implements $LetterCopyWith<$Res> {
  _$LetterCopyWithImpl(this._self, this._then);

  final Letter _self;
  final $Res Function(Letter) _then;

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? facts = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,facts: null == facts ? _self.facts : facts // ignore: cast_nullable_to_non_nullable
as List<LetterFact>,
  ));
}

}


/// Adds pattern-matching-related methods to [Letter].
extension LetterPatterns on Letter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Letter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Letter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Letter value)  $default,){
final _that = this;
switch (_that) {
case _Letter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Letter value)?  $default,){
final _that = this;
switch (_that) {
case _Letter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  List<LetterFact> facts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that.text,_that.facts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  List<LetterFact> facts)  $default,) {final _that = this;
switch (_that) {
case _Letter():
return $default(_that.text,_that.facts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  List<LetterFact> facts)?  $default,) {final _that = this;
switch (_that) {
case _Letter() when $default != null:
return $default(_that.text,_that.facts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Letter implements Letter {
  const _Letter({required this.text, final  List<LetterFact> facts = const <LetterFact>[]}): _facts = facts;
  factory _Letter.fromJson(Map<String, dynamic> json) => _$LetterFromJson(json);

@override final  String text;
 final  List<LetterFact> _facts;
@override@JsonKey() List<LetterFact> get facts {
  if (_facts is EqualUnmodifiableListView) return _facts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facts);
}


/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LetterCopyWith<_Letter> get copyWith => __$LetterCopyWithImpl<_Letter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LetterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Letter&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._facts, _facts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,const DeepCollectionEquality().hash(_facts));

@override
String toString() {
  return 'Letter(text: $text, facts: $facts)';
}


}

/// @nodoc
abstract mixin class _$LetterCopyWith<$Res> implements $LetterCopyWith<$Res> {
  factory _$LetterCopyWith(_Letter value, $Res Function(_Letter) _then) = __$LetterCopyWithImpl;
@override @useResult
$Res call({
 String text, List<LetterFact> facts
});




}
/// @nodoc
class __$LetterCopyWithImpl<$Res>
    implements _$LetterCopyWith<$Res> {
  __$LetterCopyWithImpl(this._self, this._then);

  final _Letter _self;
  final $Res Function(_Letter) _then;

/// Create a copy of Letter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? facts = null,}) {
  return _then(_Letter(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,facts: null == facts ? _self._facts : facts // ignore: cast_nullable_to_non_nullable
as List<LetterFact>,
  ));
}


}


/// @nodoc
mixin _$Brief {

 List<String> get questions;@JsonKey(name: 'likely_test') String? get likelyTest;@JsonKey(name: 'salary_range') String? get salaryRange;@JsonKey(name: 'red_flags') List<String> get redFlags;
/// Create a copy of Brief
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BriefCopyWith<Brief> get copyWith => _$BriefCopyWithImpl<Brief>(this as Brief, _$identity);

  /// Serializes this Brief to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brief&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.likelyTest, likelyTest) || other.likelyTest == likelyTest)&&(identical(other.salaryRange, salaryRange) || other.salaryRange == salaryRange)&&const DeepCollectionEquality().equals(other.redFlags, redFlags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(questions),likelyTest,salaryRange,const DeepCollectionEquality().hash(redFlags));

@override
String toString() {
  return 'Brief(questions: $questions, likelyTest: $likelyTest, salaryRange: $salaryRange, redFlags: $redFlags)';
}


}

/// @nodoc
abstract mixin class $BriefCopyWith<$Res>  {
  factory $BriefCopyWith(Brief value, $Res Function(Brief) _then) = _$BriefCopyWithImpl;
@useResult
$Res call({
 List<String> questions,@JsonKey(name: 'likely_test') String? likelyTest,@JsonKey(name: 'salary_range') String? salaryRange,@JsonKey(name: 'red_flags') List<String> redFlags
});




}
/// @nodoc
class _$BriefCopyWithImpl<$Res>
    implements $BriefCopyWith<$Res> {
  _$BriefCopyWithImpl(this._self, this._then);

  final Brief _self;
  final $Res Function(Brief) _then;

/// Create a copy of Brief
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questions = null,Object? likelyTest = freezed,Object? salaryRange = freezed,Object? redFlags = null,}) {
  return _then(_self.copyWith(
questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>,likelyTest: freezed == likelyTest ? _self.likelyTest : likelyTest // ignore: cast_nullable_to_non_nullable
as String?,salaryRange: freezed == salaryRange ? _self.salaryRange : salaryRange // ignore: cast_nullable_to_non_nullable
as String?,redFlags: null == redFlags ? _self.redFlags : redFlags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Brief].
extension BriefPatterns on Brief {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Brief value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Brief() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Brief value)  $default,){
final _that = this;
switch (_that) {
case _Brief():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Brief value)?  $default,){
final _that = this;
switch (_that) {
case _Brief() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> questions, @JsonKey(name: 'likely_test')  String? likelyTest, @JsonKey(name: 'salary_range')  String? salaryRange, @JsonKey(name: 'red_flags')  List<String> redFlags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Brief() when $default != null:
return $default(_that.questions,_that.likelyTest,_that.salaryRange,_that.redFlags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> questions, @JsonKey(name: 'likely_test')  String? likelyTest, @JsonKey(name: 'salary_range')  String? salaryRange, @JsonKey(name: 'red_flags')  List<String> redFlags)  $default,) {final _that = this;
switch (_that) {
case _Brief():
return $default(_that.questions,_that.likelyTest,_that.salaryRange,_that.redFlags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> questions, @JsonKey(name: 'likely_test')  String? likelyTest, @JsonKey(name: 'salary_range')  String? salaryRange, @JsonKey(name: 'red_flags')  List<String> redFlags)?  $default,) {final _that = this;
switch (_that) {
case _Brief() when $default != null:
return $default(_that.questions,_that.likelyTest,_that.salaryRange,_that.redFlags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Brief implements Brief {
  const _Brief({final  List<String> questions = const <String>[], @JsonKey(name: 'likely_test') this.likelyTest, @JsonKey(name: 'salary_range') this.salaryRange, @JsonKey(name: 'red_flags') final  List<String> redFlags = const <String>[]}): _questions = questions,_redFlags = redFlags;
  factory _Brief.fromJson(Map<String, dynamic> json) => _$BriefFromJson(json);

 final  List<String> _questions;
@override@JsonKey() List<String> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override@JsonKey(name: 'likely_test') final  String? likelyTest;
@override@JsonKey(name: 'salary_range') final  String? salaryRange;
 final  List<String> _redFlags;
@override@JsonKey(name: 'red_flags') List<String> get redFlags {
  if (_redFlags is EqualUnmodifiableListView) return _redFlags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_redFlags);
}


/// Create a copy of Brief
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BriefCopyWith<_Brief> get copyWith => __$BriefCopyWithImpl<_Brief>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BriefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brief&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.likelyTest, likelyTest) || other.likelyTest == likelyTest)&&(identical(other.salaryRange, salaryRange) || other.salaryRange == salaryRange)&&const DeepCollectionEquality().equals(other._redFlags, _redFlags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_questions),likelyTest,salaryRange,const DeepCollectionEquality().hash(_redFlags));

@override
String toString() {
  return 'Brief(questions: $questions, likelyTest: $likelyTest, salaryRange: $salaryRange, redFlags: $redFlags)';
}


}

/// @nodoc
abstract mixin class _$BriefCopyWith<$Res> implements $BriefCopyWith<$Res> {
  factory _$BriefCopyWith(_Brief value, $Res Function(_Brief) _then) = __$BriefCopyWithImpl;
@override @useResult
$Res call({
 List<String> questions,@JsonKey(name: 'likely_test') String? likelyTest,@JsonKey(name: 'salary_range') String? salaryRange,@JsonKey(name: 'red_flags') List<String> redFlags
});




}
/// @nodoc
class __$BriefCopyWithImpl<$Res>
    implements _$BriefCopyWith<$Res> {
  __$BriefCopyWithImpl(this._self, this._then);

  final _Brief _self;
  final $Res Function(_Brief) _then;

/// Create a copy of Brief
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questions = null,Object? likelyTest = freezed,Object? salaryRange = freezed,Object? redFlags = null,}) {
  return _then(_Brief(
questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>,likelyTest: freezed == likelyTest ? _self.likelyTest : likelyTest // ignore: cast_nullable_to_non_nullable
as String?,salaryRange: freezed == salaryRange ? _self.salaryRange : salaryRange // ignore: cast_nullable_to_non_nullable
as String?,redFlags: null == redFlags ? _self._redFlags : redFlags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$Confidence {

 double get company; double get owner; double get reviews;
/// Create a copy of Confidence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfidenceCopyWith<Confidence> get copyWith => _$ConfidenceCopyWithImpl<Confidence>(this as Confidence, _$identity);

  /// Serializes this Confidence to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Confidence&&(identical(other.company, company) || other.company == company)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.reviews, reviews) || other.reviews == reviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,owner,reviews);

@override
String toString() {
  return 'Confidence(company: $company, owner: $owner, reviews: $reviews)';
}


}

/// @nodoc
abstract mixin class $ConfidenceCopyWith<$Res>  {
  factory $ConfidenceCopyWith(Confidence value, $Res Function(Confidence) _then) = _$ConfidenceCopyWithImpl;
@useResult
$Res call({
 double company, double owner, double reviews
});




}
/// @nodoc
class _$ConfidenceCopyWithImpl<$Res>
    implements $ConfidenceCopyWith<$Res> {
  _$ConfidenceCopyWithImpl(this._self, this._then);

  final Confidence _self;
  final $Res Function(Confidence) _then;

/// Create a copy of Confidence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? company = null,Object? owner = null,Object? reviews = null,}) {
  return _then(_self.copyWith(
company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as double,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as double,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Confidence].
extension ConfidencePatterns on Confidence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Confidence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Confidence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Confidence value)  $default,){
final _that = this;
switch (_that) {
case _Confidence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Confidence value)?  $default,){
final _that = this;
switch (_that) {
case _Confidence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double company,  double owner,  double reviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Confidence() when $default != null:
return $default(_that.company,_that.owner,_that.reviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double company,  double owner,  double reviews)  $default,) {final _that = this;
switch (_that) {
case _Confidence():
return $default(_that.company,_that.owner,_that.reviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double company,  double owner,  double reviews)?  $default,) {final _that = this;
switch (_that) {
case _Confidence() when $default != null:
return $default(_that.company,_that.owner,_that.reviews);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Confidence implements Confidence {
  const _Confidence({this.company = 0.0, this.owner = 0.0, this.reviews = 0.0});
  factory _Confidence.fromJson(Map<String, dynamic> json) => _$ConfidenceFromJson(json);

@override@JsonKey() final  double company;
@override@JsonKey() final  double owner;
@override@JsonKey() final  double reviews;

/// Create a copy of Confidence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfidenceCopyWith<_Confidence> get copyWith => __$ConfidenceCopyWithImpl<_Confidence>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfidenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Confidence&&(identical(other.company, company) || other.company == company)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.reviews, reviews) || other.reviews == reviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,owner,reviews);

@override
String toString() {
  return 'Confidence(company: $company, owner: $owner, reviews: $reviews)';
}


}

/// @nodoc
abstract mixin class _$ConfidenceCopyWith<$Res> implements $ConfidenceCopyWith<$Res> {
  factory _$ConfidenceCopyWith(_Confidence value, $Res Function(_Confidence) _then) = __$ConfidenceCopyWithImpl;
@override @useResult
$Res call({
 double company, double owner, double reviews
});




}
/// @nodoc
class __$ConfidenceCopyWithImpl<$Res>
    implements _$ConfidenceCopyWith<$Res> {
  __$ConfidenceCopyWithImpl(this._self, this._then);

  final _Confidence _self;
  final $Res Function(_Confidence) _then;

/// Create a copy of Confidence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? company = null,Object? owner = null,Object? reviews = null,}) {
  return _then(_Confidence(
company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as double,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as double,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CardMeta {

 Confidence get confidence;@JsonKey(name: 'cache_key') String get cacheKey;@JsonKey(name: 'expires_at') String get expiresAt;
/// Create a copy of CardMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardMetaCopyWith<CardMeta> get copyWith => _$CardMetaCopyWithImpl<CardMeta>(this as CardMeta, _$identity);

  /// Serializes this CardMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardMeta&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.cacheKey, cacheKey) || other.cacheKey == cacheKey)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,confidence,cacheKey,expiresAt);

@override
String toString() {
  return 'CardMeta(confidence: $confidence, cacheKey: $cacheKey, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $CardMetaCopyWith<$Res>  {
  factory $CardMetaCopyWith(CardMeta value, $Res Function(CardMeta) _then) = _$CardMetaCopyWithImpl;
@useResult
$Res call({
 Confidence confidence,@JsonKey(name: 'cache_key') String cacheKey,@JsonKey(name: 'expires_at') String expiresAt
});


$ConfidenceCopyWith<$Res> get confidence;

}
/// @nodoc
class _$CardMetaCopyWithImpl<$Res>
    implements $CardMetaCopyWith<$Res> {
  _$CardMetaCopyWithImpl(this._self, this._then);

  final CardMeta _self;
  final $Res Function(CardMeta) _then;

/// Create a copy of CardMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? confidence = null,Object? cacheKey = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as Confidence,cacheKey: null == cacheKey ? _self.cacheKey : cacheKey // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CardMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfidenceCopyWith<$Res> get confidence {
  
  return $ConfidenceCopyWith<$Res>(_self.confidence, (value) {
    return _then(_self.copyWith(confidence: value));
  });
}
}


/// Adds pattern-matching-related methods to [CardMeta].
extension CardMetaPatterns on CardMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardMeta value)  $default,){
final _that = this;
switch (_that) {
case _CardMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardMeta value)?  $default,){
final _that = this;
switch (_that) {
case _CardMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Confidence confidence, @JsonKey(name: 'cache_key')  String cacheKey, @JsonKey(name: 'expires_at')  String expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardMeta() when $default != null:
return $default(_that.confidence,_that.cacheKey,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Confidence confidence, @JsonKey(name: 'cache_key')  String cacheKey, @JsonKey(name: 'expires_at')  String expiresAt)  $default,) {final _that = this;
switch (_that) {
case _CardMeta():
return $default(_that.confidence,_that.cacheKey,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Confidence confidence, @JsonKey(name: 'cache_key')  String cacheKey, @JsonKey(name: 'expires_at')  String expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _CardMeta() when $default != null:
return $default(_that.confidence,_that.cacheKey,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardMeta implements CardMeta {
  const _CardMeta({this.confidence = const Confidence(), @JsonKey(name: 'cache_key') required this.cacheKey, @JsonKey(name: 'expires_at') required this.expiresAt});
  factory _CardMeta.fromJson(Map<String, dynamic> json) => _$CardMetaFromJson(json);

@override@JsonKey() final  Confidence confidence;
@override@JsonKey(name: 'cache_key') final  String cacheKey;
@override@JsonKey(name: 'expires_at') final  String expiresAt;

/// Create a copy of CardMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardMetaCopyWith<_CardMeta> get copyWith => __$CardMetaCopyWithImpl<_CardMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardMeta&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.cacheKey, cacheKey) || other.cacheKey == cacheKey)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,confidence,cacheKey,expiresAt);

@override
String toString() {
  return 'CardMeta(confidence: $confidence, cacheKey: $cacheKey, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$CardMetaCopyWith<$Res> implements $CardMetaCopyWith<$Res> {
  factory _$CardMetaCopyWith(_CardMeta value, $Res Function(_CardMeta) _then) = __$CardMetaCopyWithImpl;
@override @useResult
$Res call({
 Confidence confidence,@JsonKey(name: 'cache_key') String cacheKey,@JsonKey(name: 'expires_at') String expiresAt
});


@override $ConfidenceCopyWith<$Res> get confidence;

}
/// @nodoc
class __$CardMetaCopyWithImpl<$Res>
    implements _$CardMetaCopyWith<$Res> {
  __$CardMetaCopyWithImpl(this._self, this._then);

  final _CardMeta _self;
  final $Res Function(_CardMeta) _then;

/// Create a copy of CardMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? confidence = null,Object? cacheKey = null,Object? expiresAt = null,}) {
  return _then(_CardMeta(
confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as Confidence,cacheKey: null == cacheKey ? _self.cacheKey : cacheKey // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CardMeta
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfidenceCopyWith<$Res> get confidence {
  
  return $ConfidenceCopyWith<$Res>(_self.confidence, (value) {
    return _then(_self.copyWith(confidence: value));
  });
}
}


/// @nodoc
mixin _$ResultCard {

 Vacancy get vacancy; Company? get company; Owner? get owner; List<Review> get reviews; Letter? get letter; Brief? get brief; CardMeta get meta;
/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultCardCopyWith<ResultCard> get copyWith => _$ResultCardCopyWithImpl<ResultCard>(this as ResultCard, _$identity);

  /// Serializes this ResultCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultCard&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy)&&(identical(other.company, company) || other.company == company)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vacancy,company,owner,const DeepCollectionEquality().hash(reviews),letter,brief,meta);

@override
String toString() {
  return 'ResultCard(vacancy: $vacancy, company: $company, owner: $owner, reviews: $reviews, letter: $letter, brief: $brief, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $ResultCardCopyWith<$Res>  {
  factory $ResultCardCopyWith(ResultCard value, $Res Function(ResultCard) _then) = _$ResultCardCopyWithImpl;
@useResult
$Res call({
 Vacancy vacancy, Company? company, Owner? owner, List<Review> reviews, Letter? letter, Brief? brief, CardMeta meta
});


$VacancyCopyWith<$Res> get vacancy;$CompanyCopyWith<$Res>? get company;$OwnerCopyWith<$Res>? get owner;$LetterCopyWith<$Res>? get letter;$BriefCopyWith<$Res>? get brief;$CardMetaCopyWith<$Res> get meta;

}
/// @nodoc
class _$ResultCardCopyWithImpl<$Res>
    implements $ResultCardCopyWith<$Res> {
  _$ResultCardCopyWithImpl(this._self, this._then);

  final ResultCard _self;
  final $Res Function(ResultCard) _then;

/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vacancy = null,Object? company = freezed,Object? owner = freezed,Object? reviews = null,Object? letter = freezed,Object? brief = freezed,Object? meta = null,}) {
  return _then(_self.copyWith(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as Vacancy,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as Owner?,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,letter: freezed == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as Letter?,brief: freezed == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as Brief?,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as CardMeta,
  ));
}
/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VacancyCopyWith<$Res> get vacancy {
  
  return $VacancyCopyWith<$Res>(_self.vacancy, (value) {
    return _then(_self.copyWith(vacancy: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $OwnerCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LetterCopyWith<$Res>? get letter {
    if (_self.letter == null) {
    return null;
  }

  return $LetterCopyWith<$Res>(_self.letter!, (value) {
    return _then(_self.copyWith(letter: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BriefCopyWith<$Res>? get brief {
    if (_self.brief == null) {
    return null;
  }

  return $BriefCopyWith<$Res>(_self.brief!, (value) {
    return _then(_self.copyWith(brief: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardMetaCopyWith<$Res> get meta {
  
  return $CardMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResultCard].
extension ResultCardPatterns on ResultCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultCard value)  $default,){
final _that = this;
switch (_that) {
case _ResultCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultCard value)?  $default,){
final _that = this;
switch (_that) {
case _ResultCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Vacancy vacancy,  Company? company,  Owner? owner,  List<Review> reviews,  Letter? letter,  Brief? brief,  CardMeta meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultCard() when $default != null:
return $default(_that.vacancy,_that.company,_that.owner,_that.reviews,_that.letter,_that.brief,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Vacancy vacancy,  Company? company,  Owner? owner,  List<Review> reviews,  Letter? letter,  Brief? brief,  CardMeta meta)  $default,) {final _that = this;
switch (_that) {
case _ResultCard():
return $default(_that.vacancy,_that.company,_that.owner,_that.reviews,_that.letter,_that.brief,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Vacancy vacancy,  Company? company,  Owner? owner,  List<Review> reviews,  Letter? letter,  Brief? brief,  CardMeta meta)?  $default,) {final _that = this;
switch (_that) {
case _ResultCard() when $default != null:
return $default(_that.vacancy,_that.company,_that.owner,_that.reviews,_that.letter,_that.brief,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultCard implements ResultCard {
  const _ResultCard({required this.vacancy, this.company, this.owner, final  List<Review> reviews = const <Review>[], this.letter, this.brief, required this.meta}): _reviews = reviews;
  factory _ResultCard.fromJson(Map<String, dynamic> json) => _$ResultCardFromJson(json);

@override final  Vacancy vacancy;
@override final  Company? company;
@override final  Owner? owner;
 final  List<Review> _reviews;
@override@JsonKey() List<Review> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

@override final  Letter? letter;
@override final  Brief? brief;
@override final  CardMeta meta;

/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultCardCopyWith<_ResultCard> get copyWith => __$ResultCardCopyWithImpl<_ResultCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultCard&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy)&&(identical(other.company, company) || other.company == company)&&(identical(other.owner, owner) || other.owner == owner)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.letter, letter) || other.letter == letter)&&(identical(other.brief, brief) || other.brief == brief)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vacancy,company,owner,const DeepCollectionEquality().hash(_reviews),letter,brief,meta);

@override
String toString() {
  return 'ResultCard(vacancy: $vacancy, company: $company, owner: $owner, reviews: $reviews, letter: $letter, brief: $brief, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$ResultCardCopyWith<$Res> implements $ResultCardCopyWith<$Res> {
  factory _$ResultCardCopyWith(_ResultCard value, $Res Function(_ResultCard) _then) = __$ResultCardCopyWithImpl;
@override @useResult
$Res call({
 Vacancy vacancy, Company? company, Owner? owner, List<Review> reviews, Letter? letter, Brief? brief, CardMeta meta
});


@override $VacancyCopyWith<$Res> get vacancy;@override $CompanyCopyWith<$Res>? get company;@override $OwnerCopyWith<$Res>? get owner;@override $LetterCopyWith<$Res>? get letter;@override $BriefCopyWith<$Res>? get brief;@override $CardMetaCopyWith<$Res> get meta;

}
/// @nodoc
class __$ResultCardCopyWithImpl<$Res>
    implements _$ResultCardCopyWith<$Res> {
  __$ResultCardCopyWithImpl(this._self, this._then);

  final _ResultCard _self;
  final $Res Function(_ResultCard) _then;

/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vacancy = null,Object? company = freezed,Object? owner = freezed,Object? reviews = null,Object? letter = freezed,Object? brief = freezed,Object? meta = null,}) {
  return _then(_ResultCard(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as Vacancy,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as Owner?,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,letter: freezed == letter ? _self.letter : letter // ignore: cast_nullable_to_non_nullable
as Letter?,brief: freezed == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as Brief?,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as CardMeta,
  ));
}

/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VacancyCopyWith<$Res> get vacancy {
  
  return $VacancyCopyWith<$Res>(_self.vacancy, (value) {
    return _then(_self.copyWith(vacancy: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $OwnerCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LetterCopyWith<$Res>? get letter {
    if (_self.letter == null) {
    return null;
  }

  return $LetterCopyWith<$Res>(_self.letter!, (value) {
    return _then(_self.copyWith(letter: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BriefCopyWith<$Res>? get brief {
    if (_self.brief == null) {
    return null;
  }

  return $BriefCopyWith<$Res>(_self.brief!, (value) {
    return _then(_self.copyWith(brief: value));
  });
}/// Create a copy of ResultCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardMetaCopyWith<$Res> get meta {
  
  return $CardMetaCopyWith<$Res>(_self.meta, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$SearchResultItem {

 String get id; String get title;@JsonKey(name: 'company_name') String? get companyName;@JsonKey(name: 'company_inn') String? get companyInn;@JsonKey(name: 'salary_from') int? get salaryFrom;@JsonKey(name: 'salary_to') int? get salaryTo; String? get location; String get url;@JsonKey(name: 'published_at') String? get publishedAt; String? get description; String get source;
/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultItemCopyWith<SearchResultItem> get copyWith => _$SearchResultItemCopyWithImpl<SearchResultItem>(this as SearchResultItem, _$identity);

  /// Serializes this SearchResultItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyInn, companyInn) || other.companyInn == companyInn)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.location, location) || other.location == location)&&(identical(other.url, url) || other.url == url)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,companyName,companyInn,salaryFrom,salaryTo,location,url,publishedAt,description,source);

@override
String toString() {
  return 'SearchResultItem(id: $id, title: $title, companyName: $companyName, companyInn: $companyInn, salaryFrom: $salaryFrom, salaryTo: $salaryTo, location: $location, url: $url, publishedAt: $publishedAt, description: $description, source: $source)';
}


}

/// @nodoc
abstract mixin class $SearchResultItemCopyWith<$Res>  {
  factory $SearchResultItemCopyWith(SearchResultItem value, $Res Function(SearchResultItem) _then) = _$SearchResultItemCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'company_inn') String? companyInn,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? location, String url,@JsonKey(name: 'published_at') String? publishedAt, String? description, String source
});




}
/// @nodoc
class _$SearchResultItemCopyWithImpl<$Res>
    implements $SearchResultItemCopyWith<$Res> {
  _$SearchResultItemCopyWithImpl(this._self, this._then);

  final SearchResultItem _self;
  final $Res Function(SearchResultItem) _then;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? companyName = freezed,Object? companyInn = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? location = freezed,Object? url = null,Object? publishedAt = freezed,Object? description = freezed,Object? source = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyInn: freezed == companyInn ? _self.companyInn : companyInn // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResultItem].
extension SearchResultItemPatterns on SearchResultItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultItem value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultItem value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? location,  String url, @JsonKey(name: 'published_at')  String? publishedAt,  String? description,  String source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
return $default(_that.id,_that.title,_that.companyName,_that.companyInn,_that.salaryFrom,_that.salaryTo,_that.location,_that.url,_that.publishedAt,_that.description,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? location,  String url, @JsonKey(name: 'published_at')  String? publishedAt,  String? description,  String source)  $default,) {final _that = this;
switch (_that) {
case _SearchResultItem():
return $default(_that.id,_that.title,_that.companyName,_that.companyInn,_that.salaryFrom,_that.salaryTo,_that.location,_that.url,_that.publishedAt,_that.description,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? location,  String url, @JsonKey(name: 'published_at')  String? publishedAt,  String? description,  String source)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultItem() when $default != null:
return $default(_that.id,_that.title,_that.companyName,_that.companyInn,_that.salaryFrom,_that.salaryTo,_that.location,_that.url,_that.publishedAt,_that.description,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResultItem implements SearchResultItem {
  const _SearchResultItem({required this.id, required this.title, @JsonKey(name: 'company_name') this.companyName, @JsonKey(name: 'company_inn') this.companyInn, @JsonKey(name: 'salary_from') this.salaryFrom, @JsonKey(name: 'salary_to') this.salaryTo, this.location, required this.url, @JsonKey(name: 'published_at') this.publishedAt, this.description, required this.source});
  factory _SearchResultItem.fromJson(Map<String, dynamic> json) => _$SearchResultItemFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'company_name') final  String? companyName;
@override@JsonKey(name: 'company_inn') final  String? companyInn;
@override@JsonKey(name: 'salary_from') final  int? salaryFrom;
@override@JsonKey(name: 'salary_to') final  int? salaryTo;
@override final  String? location;
@override final  String url;
@override@JsonKey(name: 'published_at') final  String? publishedAt;
@override final  String? description;
@override final  String source;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultItemCopyWith<_SearchResultItem> get copyWith => __$SearchResultItemCopyWithImpl<_SearchResultItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyInn, companyInn) || other.companyInn == companyInn)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.location, location) || other.location == location)&&(identical(other.url, url) || other.url == url)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,companyName,companyInn,salaryFrom,salaryTo,location,url,publishedAt,description,source);

@override
String toString() {
  return 'SearchResultItem(id: $id, title: $title, companyName: $companyName, companyInn: $companyInn, salaryFrom: $salaryFrom, salaryTo: $salaryTo, location: $location, url: $url, publishedAt: $publishedAt, description: $description, source: $source)';
}


}

/// @nodoc
abstract mixin class _$SearchResultItemCopyWith<$Res> implements $SearchResultItemCopyWith<$Res> {
  factory _$SearchResultItemCopyWith(_SearchResultItem value, $Res Function(_SearchResultItem) _then) = __$SearchResultItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'company_inn') String? companyInn,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? location, String url,@JsonKey(name: 'published_at') String? publishedAt, String? description, String source
});




}
/// @nodoc
class __$SearchResultItemCopyWithImpl<$Res>
    implements _$SearchResultItemCopyWith<$Res> {
  __$SearchResultItemCopyWithImpl(this._self, this._then);

  final _SearchResultItem _self;
  final $Res Function(_SearchResultItem) _then;

/// Create a copy of SearchResultItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? companyName = freezed,Object? companyInn = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? location = freezed,Object? url = null,Object? publishedAt = freezed,Object? description = freezed,Object? source = null,}) {
  return _then(_SearchResultItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyInn: freezed == companyInn ? _self.companyInn : companyInn // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SearchSourceError {

 String get source; String get reason;
/// Create a copy of SearchSourceError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSourceErrorCopyWith<SearchSourceError> get copyWith => _$SearchSourceErrorCopyWithImpl<SearchSourceError>(this as SearchSourceError, _$identity);

  /// Serializes this SearchSourceError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSourceError&&(identical(other.source, source) || other.source == source)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,reason);

@override
String toString() {
  return 'SearchSourceError(source: $source, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $SearchSourceErrorCopyWith<$Res>  {
  factory $SearchSourceErrorCopyWith(SearchSourceError value, $Res Function(SearchSourceError) _then) = _$SearchSourceErrorCopyWithImpl;
@useResult
$Res call({
 String source, String reason
});




}
/// @nodoc
class _$SearchSourceErrorCopyWithImpl<$Res>
    implements $SearchSourceErrorCopyWith<$Res> {
  _$SearchSourceErrorCopyWithImpl(this._self, this._then);

  final SearchSourceError _self;
  final $Res Function(SearchSourceError) _then;

/// Create a copy of SearchSourceError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? reason = null,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchSourceError].
extension SearchSourceErrorPatterns on SearchSourceError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchSourceError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchSourceError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchSourceError value)  $default,){
final _that = this;
switch (_that) {
case _SearchSourceError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchSourceError value)?  $default,){
final _that = this;
switch (_that) {
case _SearchSourceError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String source,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchSourceError() when $default != null:
return $default(_that.source,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String source,  String reason)  $default,) {final _that = this;
switch (_that) {
case _SearchSourceError():
return $default(_that.source,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String source,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _SearchSourceError() when $default != null:
return $default(_that.source,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchSourceError implements SearchSourceError {
  const _SearchSourceError({required this.source, required this.reason});
  factory _SearchSourceError.fromJson(Map<String, dynamic> json) => _$SearchSourceErrorFromJson(json);

@override final  String source;
@override final  String reason;

/// Create a copy of SearchSourceError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchSourceErrorCopyWith<_SearchSourceError> get copyWith => __$SearchSourceErrorCopyWithImpl<_SearchSourceError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchSourceErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchSourceError&&(identical(other.source, source) || other.source == source)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,reason);

@override
String toString() {
  return 'SearchSourceError(source: $source, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$SearchSourceErrorCopyWith<$Res> implements $SearchSourceErrorCopyWith<$Res> {
  factory _$SearchSourceErrorCopyWith(_SearchSourceError value, $Res Function(_SearchSourceError) _then) = __$SearchSourceErrorCopyWithImpl;
@override @useResult
$Res call({
 String source, String reason
});




}
/// @nodoc
class __$SearchSourceErrorCopyWithImpl<$Res>
    implements _$SearchSourceErrorCopyWith<$Res> {
  __$SearchSourceErrorCopyWithImpl(this._self, this._then);

  final _SearchSourceError _self;
  final $Res Function(_SearchSourceError) _then;

/// Create a copy of SearchSourceError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? reason = null,}) {
  return _then(_SearchSourceError(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SearchResult {

 List<SearchResultItem> get items; List<SearchSourceError> get errors;
/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultCopyWith<SearchResult> get copyWith => _$SearchResultCopyWithImpl<SearchResult>(this as SearchResult, _$identity);

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResult&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'SearchResult(items: $items, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $SearchResultCopyWith<$Res>  {
  factory $SearchResultCopyWith(SearchResult value, $Res Function(SearchResult) _then) = _$SearchResultCopyWithImpl;
@useResult
$Res call({
 List<SearchResultItem> items, List<SearchSourceError> errors
});




}
/// @nodoc
class _$SearchResultCopyWithImpl<$Res>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._self, this._then);

  final SearchResult _self;
  final $Res Function(SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? errors = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<SearchSourceError>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResult].
extension SearchResultPatterns on SearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResult value)  $default,){
final _that = this;
switch (_that) {
case _SearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchResultItem> items,  List<SearchSourceError> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that.items,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchResultItem> items,  List<SearchSourceError> errors)  $default,) {final _that = this;
switch (_that) {
case _SearchResult():
return $default(_that.items,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchResultItem> items,  List<SearchSourceError> errors)?  $default,) {final _that = this;
switch (_that) {
case _SearchResult() when $default != null:
return $default(_that.items,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchResult implements SearchResult {
  const _SearchResult({final  List<SearchResultItem> items = const <SearchResultItem>[], final  List<SearchSourceError> errors = const <SearchSourceError>[]}): _items = items,_errors = errors;
  factory _SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

 final  List<SearchResultItem> _items;
@override@JsonKey() List<SearchResultItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<SearchSourceError> _errors;
@override@JsonKey() List<SearchSourceError> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultCopyWith<_SearchResult> get copyWith => __$SearchResultCopyWithImpl<_SearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResult&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._errors, _errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'SearchResult(items: $items, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$SearchResultCopyWith<$Res> implements $SearchResultCopyWith<$Res> {
  factory _$SearchResultCopyWith(_SearchResult value, $Res Function(_SearchResult) _then) = __$SearchResultCopyWithImpl;
@override @useResult
$Res call({
 List<SearchResultItem> items, List<SearchSourceError> errors
});




}
/// @nodoc
class __$SearchResultCopyWithImpl<$Res>
    implements _$SearchResultCopyWith<$Res> {
  __$SearchResultCopyWithImpl(this._self, this._then);

  final _SearchResult _self;
  final $Res Function(_SearchResult) _then;

/// Create a copy of SearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? errors = null,}) {
  return _then(_SearchResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SearchResultItem>,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<SearchSourceError>,
  ));
}


}


/// @nodoc
mixin _$SearchRequestBody {

 String get query; String? get region; bool? get remote;@JsonKey(name: 'salary_from') int? get salaryFrom; List<String>? get sources; int get limit;
/// Create a copy of SearchRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRequestBodyCopyWith<SearchRequestBody> get copyWith => _$SearchRequestBodyCopyWithImpl<SearchRequestBody>(this as SearchRequestBody, _$identity);

  /// Serializes this SearchRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRequestBody&&(identical(other.query, query) || other.query == query)&&(identical(other.region, region) || other.region == region)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&const DeepCollectionEquality().equals(other.sources, sources)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,region,remote,salaryFrom,const DeepCollectionEquality().hash(sources),limit);

@override
String toString() {
  return 'SearchRequestBody(query: $query, region: $region, remote: $remote, salaryFrom: $salaryFrom, sources: $sources, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $SearchRequestBodyCopyWith<$Res>  {
  factory $SearchRequestBodyCopyWith(SearchRequestBody value, $Res Function(SearchRequestBody) _then) = _$SearchRequestBodyCopyWithImpl;
@useResult
$Res call({
 String query, String? region, bool? remote,@JsonKey(name: 'salary_from') int? salaryFrom, List<String>? sources, int limit
});




}
/// @nodoc
class _$SearchRequestBodyCopyWithImpl<$Res>
    implements $SearchRequestBodyCopyWith<$Res> {
  _$SearchRequestBodyCopyWithImpl(this._self, this._then);

  final SearchRequestBody _self;
  final $Res Function(SearchRequestBody) _then;

/// Create a copy of SearchRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? region = freezed,Object? remote = freezed,Object? salaryFrom = freezed,Object? sources = freezed,Object? limit = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as bool?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,sources: freezed == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<String>?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchRequestBody].
extension SearchRequestBodyPatterns on SearchRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _SearchRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _SearchRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  String? region,  bool? remote, @JsonKey(name: 'salary_from')  int? salaryFrom,  List<String>? sources,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchRequestBody() when $default != null:
return $default(_that.query,_that.region,_that.remote,_that.salaryFrom,_that.sources,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  String? region,  bool? remote, @JsonKey(name: 'salary_from')  int? salaryFrom,  List<String>? sources,  int limit)  $default,) {final _that = this;
switch (_that) {
case _SearchRequestBody():
return $default(_that.query,_that.region,_that.remote,_that.salaryFrom,_that.sources,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  String? region,  bool? remote, @JsonKey(name: 'salary_from')  int? salaryFrom,  List<String>? sources,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _SearchRequestBody() when $default != null:
return $default(_that.query,_that.region,_that.remote,_that.salaryFrom,_that.sources,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchRequestBody implements SearchRequestBody {
  const _SearchRequestBody({required this.query, this.region, this.remote, @JsonKey(name: 'salary_from') this.salaryFrom, final  List<String>? sources, this.limit = 20}): _sources = sources;
  factory _SearchRequestBody.fromJson(Map<String, dynamic> json) => _$SearchRequestBodyFromJson(json);

@override final  String query;
@override final  String? region;
@override final  bool? remote;
@override@JsonKey(name: 'salary_from') final  int? salaryFrom;
 final  List<String>? _sources;
@override List<String>? get sources {
  final value = _sources;
  if (value == null) return null;
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  int limit;

/// Create a copy of SearchRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchRequestBodyCopyWith<_SearchRequestBody> get copyWith => __$SearchRequestBodyCopyWithImpl<_SearchRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchRequestBody&&(identical(other.query, query) || other.query == query)&&(identical(other.region, region) || other.region == region)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,region,remote,salaryFrom,const DeepCollectionEquality().hash(_sources),limit);

@override
String toString() {
  return 'SearchRequestBody(query: $query, region: $region, remote: $remote, salaryFrom: $salaryFrom, sources: $sources, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$SearchRequestBodyCopyWith<$Res> implements $SearchRequestBodyCopyWith<$Res> {
  factory _$SearchRequestBodyCopyWith(_SearchRequestBody value, $Res Function(_SearchRequestBody) _then) = __$SearchRequestBodyCopyWithImpl;
@override @useResult
$Res call({
 String query, String? region, bool? remote,@JsonKey(name: 'salary_from') int? salaryFrom, List<String>? sources, int limit
});




}
/// @nodoc
class __$SearchRequestBodyCopyWithImpl<$Res>
    implements _$SearchRequestBodyCopyWith<$Res> {
  __$SearchRequestBodyCopyWithImpl(this._self, this._then);

  final _SearchRequestBody _self;
  final $Res Function(_SearchRequestBody) _then;

/// Create a copy of SearchRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? region = freezed,Object? remote = freezed,Object? salaryFrom = freezed,Object? sources = freezed,Object? limit = null,}) {
  return _then(_SearchRequestBody(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as bool?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,sources: freezed == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<String>?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PrepareRequestBody {

@JsonKey(name: 'vacancy_id') String get vacancyId; String get source;@JsonKey(name: 'profile_id') String get profileId;@JsonKey(name: 'profile_text') String? get profileText; String get title; String get url;@JsonKey(name: 'company_name') String? get companyName;@JsonKey(name: 'company_inn') String? get companyInn;@JsonKey(name: 'salary_from') int? get salaryFrom;@JsonKey(name: 'salary_to') int? get salaryTo; String? get location;@JsonKey(name: 'published_at') String? get publishedAt; String? get description;
/// Create a copy of PrepareRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrepareRequestBodyCopyWith<PrepareRequestBody> get copyWith => _$PrepareRequestBodyCopyWithImpl<PrepareRequestBody>(this as PrepareRequestBody, _$identity);

  /// Serializes this PrepareRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrepareRequestBody&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId)&&(identical(other.source, source) || other.source == source)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.profileText, profileText) || other.profileText == profileText)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyInn, companyInn) || other.companyInn == companyInn)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.location, location) || other.location == location)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vacancyId,source,profileId,profileText,title,url,companyName,companyInn,salaryFrom,salaryTo,location,publishedAt,description);

@override
String toString() {
  return 'PrepareRequestBody(vacancyId: $vacancyId, source: $source, profileId: $profileId, profileText: $profileText, title: $title, url: $url, companyName: $companyName, companyInn: $companyInn, salaryFrom: $salaryFrom, salaryTo: $salaryTo, location: $location, publishedAt: $publishedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class $PrepareRequestBodyCopyWith<$Res>  {
  factory $PrepareRequestBodyCopyWith(PrepareRequestBody value, $Res Function(PrepareRequestBody) _then) = _$PrepareRequestBodyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'vacancy_id') String vacancyId, String source,@JsonKey(name: 'profile_id') String profileId,@JsonKey(name: 'profile_text') String? profileText, String title, String url,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'company_inn') String? companyInn,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? location,@JsonKey(name: 'published_at') String? publishedAt, String? description
});




}
/// @nodoc
class _$PrepareRequestBodyCopyWithImpl<$Res>
    implements $PrepareRequestBodyCopyWith<$Res> {
  _$PrepareRequestBodyCopyWithImpl(this._self, this._then);

  final PrepareRequestBody _self;
  final $Res Function(PrepareRequestBody) _then;

/// Create a copy of PrepareRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vacancyId = null,Object? source = null,Object? profileId = null,Object? profileText = freezed,Object? title = null,Object? url = null,Object? companyName = freezed,Object? companyInn = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? location = freezed,Object? publishedAt = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,profileText: freezed == profileText ? _self.profileText : profileText // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyInn: freezed == companyInn ? _self.companyInn : companyInn // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrepareRequestBody].
extension PrepareRequestBodyPatterns on PrepareRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrepareRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrepareRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrepareRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _PrepareRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrepareRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _PrepareRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'vacancy_id')  String vacancyId,  String source, @JsonKey(name: 'profile_id')  String profileId, @JsonKey(name: 'profile_text')  String? profileText,  String title,  String url, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? location, @JsonKey(name: 'published_at')  String? publishedAt,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrepareRequestBody() when $default != null:
return $default(_that.vacancyId,_that.source,_that.profileId,_that.profileText,_that.title,_that.url,_that.companyName,_that.companyInn,_that.salaryFrom,_that.salaryTo,_that.location,_that.publishedAt,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'vacancy_id')  String vacancyId,  String source, @JsonKey(name: 'profile_id')  String profileId, @JsonKey(name: 'profile_text')  String? profileText,  String title,  String url, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? location, @JsonKey(name: 'published_at')  String? publishedAt,  String? description)  $default,) {final _that = this;
switch (_that) {
case _PrepareRequestBody():
return $default(_that.vacancyId,_that.source,_that.profileId,_that.profileText,_that.title,_that.url,_that.companyName,_that.companyInn,_that.salaryFrom,_that.salaryTo,_that.location,_that.publishedAt,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'vacancy_id')  String vacancyId,  String source, @JsonKey(name: 'profile_id')  String profileId, @JsonKey(name: 'profile_text')  String? profileText,  String title,  String url, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'company_inn')  String? companyInn, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? location, @JsonKey(name: 'published_at')  String? publishedAt,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _PrepareRequestBody() when $default != null:
return $default(_that.vacancyId,_that.source,_that.profileId,_that.profileText,_that.title,_that.url,_that.companyName,_that.companyInn,_that.salaryFrom,_that.salaryTo,_that.location,_that.publishedAt,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrepareRequestBody implements PrepareRequestBody {
  const _PrepareRequestBody({@JsonKey(name: 'vacancy_id') required this.vacancyId, required this.source, @JsonKey(name: 'profile_id') this.profileId = 'default', @JsonKey(name: 'profile_text') this.profileText, required this.title, required this.url, @JsonKey(name: 'company_name') this.companyName, @JsonKey(name: 'company_inn') this.companyInn, @JsonKey(name: 'salary_from') this.salaryFrom, @JsonKey(name: 'salary_to') this.salaryTo, this.location, @JsonKey(name: 'published_at') this.publishedAt, this.description});
  factory _PrepareRequestBody.fromJson(Map<String, dynamic> json) => _$PrepareRequestBodyFromJson(json);

@override@JsonKey(name: 'vacancy_id') final  String vacancyId;
@override final  String source;
@override@JsonKey(name: 'profile_id') final  String profileId;
@override@JsonKey(name: 'profile_text') final  String? profileText;
@override final  String title;
@override final  String url;
@override@JsonKey(name: 'company_name') final  String? companyName;
@override@JsonKey(name: 'company_inn') final  String? companyInn;
@override@JsonKey(name: 'salary_from') final  int? salaryFrom;
@override@JsonKey(name: 'salary_to') final  int? salaryTo;
@override final  String? location;
@override@JsonKey(name: 'published_at') final  String? publishedAt;
@override final  String? description;

/// Create a copy of PrepareRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrepareRequestBodyCopyWith<_PrepareRequestBody> get copyWith => __$PrepareRequestBodyCopyWithImpl<_PrepareRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrepareRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrepareRequestBody&&(identical(other.vacancyId, vacancyId) || other.vacancyId == vacancyId)&&(identical(other.source, source) || other.source == source)&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.profileText, profileText) || other.profileText == profileText)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyInn, companyInn) || other.companyInn == companyInn)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.location, location) || other.location == location)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vacancyId,source,profileId,profileText,title,url,companyName,companyInn,salaryFrom,salaryTo,location,publishedAt,description);

@override
String toString() {
  return 'PrepareRequestBody(vacancyId: $vacancyId, source: $source, profileId: $profileId, profileText: $profileText, title: $title, url: $url, companyName: $companyName, companyInn: $companyInn, salaryFrom: $salaryFrom, salaryTo: $salaryTo, location: $location, publishedAt: $publishedAt, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PrepareRequestBodyCopyWith<$Res> implements $PrepareRequestBodyCopyWith<$Res> {
  factory _$PrepareRequestBodyCopyWith(_PrepareRequestBody value, $Res Function(_PrepareRequestBody) _then) = __$PrepareRequestBodyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'vacancy_id') String vacancyId, String source,@JsonKey(name: 'profile_id') String profileId,@JsonKey(name: 'profile_text') String? profileText, String title, String url,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'company_inn') String? companyInn,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? location,@JsonKey(name: 'published_at') String? publishedAt, String? description
});




}
/// @nodoc
class __$PrepareRequestBodyCopyWithImpl<$Res>
    implements _$PrepareRequestBodyCopyWith<$Res> {
  __$PrepareRequestBodyCopyWithImpl(this._self, this._then);

  final _PrepareRequestBody _self;
  final $Res Function(_PrepareRequestBody) _then;

/// Create a copy of PrepareRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vacancyId = null,Object? source = null,Object? profileId = null,Object? profileText = freezed,Object? title = null,Object? url = null,Object? companyName = freezed,Object? companyInn = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? location = freezed,Object? publishedAt = freezed,Object? description = freezed,}) {
  return _then(_PrepareRequestBody(
vacancyId: null == vacancyId ? _self.vacancyId : vacancyId // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,profileText: freezed == profileText ? _self.profileText : profileText // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyInn: freezed == companyInn ? _self.companyInn : companyInn // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ExtractRequestBody {

@JsonKey(name: 'raw_text') String get rawText;
/// Create a copy of ExtractRequestBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtractRequestBodyCopyWith<ExtractRequestBody> get copyWith => _$ExtractRequestBodyCopyWithImpl<ExtractRequestBody>(this as ExtractRequestBody, _$identity);

  /// Serializes this ExtractRequestBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtractRequestBody&&(identical(other.rawText, rawText) || other.rawText == rawText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawText);

@override
String toString() {
  return 'ExtractRequestBody(rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class $ExtractRequestBodyCopyWith<$Res>  {
  factory $ExtractRequestBodyCopyWith(ExtractRequestBody value, $Res Function(ExtractRequestBody) _then) = _$ExtractRequestBodyCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'raw_text') String rawText
});




}
/// @nodoc
class _$ExtractRequestBodyCopyWithImpl<$Res>
    implements $ExtractRequestBodyCopyWith<$Res> {
  _$ExtractRequestBodyCopyWithImpl(this._self, this._then);

  final ExtractRequestBody _self;
  final $Res Function(ExtractRequestBody) _then;

/// Create a copy of ExtractRequestBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawText = null,}) {
  return _then(_self.copyWith(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtractRequestBody].
extension ExtractRequestBodyPatterns on ExtractRequestBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtractRequestBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtractRequestBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtractRequestBody value)  $default,){
final _that = this;
switch (_that) {
case _ExtractRequestBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtractRequestBody value)?  $default,){
final _that = this;
switch (_that) {
case _ExtractRequestBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'raw_text')  String rawText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtractRequestBody() when $default != null:
return $default(_that.rawText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'raw_text')  String rawText)  $default,) {final _that = this;
switch (_that) {
case _ExtractRequestBody():
return $default(_that.rawText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'raw_text')  String rawText)?  $default,) {final _that = this;
switch (_that) {
case _ExtractRequestBody() when $default != null:
return $default(_that.rawText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtractRequestBody implements ExtractRequestBody {
  const _ExtractRequestBody({@JsonKey(name: 'raw_text') required this.rawText});
  factory _ExtractRequestBody.fromJson(Map<String, dynamic> json) => _$ExtractRequestBodyFromJson(json);

@override@JsonKey(name: 'raw_text') final  String rawText;

/// Create a copy of ExtractRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtractRequestBodyCopyWith<_ExtractRequestBody> get copyWith => __$ExtractRequestBodyCopyWithImpl<_ExtractRequestBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtractRequestBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtractRequestBody&&(identical(other.rawText, rawText) || other.rawText == rawText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawText);

@override
String toString() {
  return 'ExtractRequestBody(rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class _$ExtractRequestBodyCopyWith<$Res> implements $ExtractRequestBodyCopyWith<$Res> {
  factory _$ExtractRequestBodyCopyWith(_ExtractRequestBody value, $Res Function(_ExtractRequestBody) _then) = __$ExtractRequestBodyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'raw_text') String rawText
});




}
/// @nodoc
class __$ExtractRequestBodyCopyWithImpl<$Res>
    implements _$ExtractRequestBodyCopyWith<$Res> {
  __$ExtractRequestBodyCopyWithImpl(this._self, this._then);

  final _ExtractRequestBody _self;
  final $Res Function(_ExtractRequestBody) _then;

/// Create a copy of ExtractRequestBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawText = null,}) {
  return _then(_ExtractRequestBody(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ExtractedVacancy {

 String? get title;@JsonKey(name: 'salary_from') int? get salaryFrom;@JsonKey(name: 'salary_to') int? get salaryTo; String? get currency; String? get employment; bool? get remote; String? get location;@JsonKey(name: 'company_name') String? get companyName; List<String> get duties; List<String> get requirements; List<String> get conditions;
/// Create a copy of ExtractedVacancy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtractedVacancyCopyWith<ExtractedVacancy> get copyWith => _$ExtractedVacancyCopyWithImpl<ExtractedVacancy>(this as ExtractedVacancy, _$identity);

  /// Serializes this ExtractedVacancy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtractedVacancy&&(identical(other.title, title) || other.title == title)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.employment, employment) || other.employment == employment)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.location, location) || other.location == location)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other.duties, duties)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.conditions, conditions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,salaryFrom,salaryTo,currency,employment,remote,location,companyName,const DeepCollectionEquality().hash(duties),const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(conditions));

@override
String toString() {
  return 'ExtractedVacancy(title: $title, salaryFrom: $salaryFrom, salaryTo: $salaryTo, currency: $currency, employment: $employment, remote: $remote, location: $location, companyName: $companyName, duties: $duties, requirements: $requirements, conditions: $conditions)';
}


}

/// @nodoc
abstract mixin class $ExtractedVacancyCopyWith<$Res>  {
  factory $ExtractedVacancyCopyWith(ExtractedVacancy value, $Res Function(ExtractedVacancy) _then) = _$ExtractedVacancyCopyWithImpl;
@useResult
$Res call({
 String? title,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? currency, String? employment, bool? remote, String? location,@JsonKey(name: 'company_name') String? companyName, List<String> duties, List<String> requirements, List<String> conditions
});




}
/// @nodoc
class _$ExtractedVacancyCopyWithImpl<$Res>
    implements $ExtractedVacancyCopyWith<$Res> {
  _$ExtractedVacancyCopyWithImpl(this._self, this._then);

  final ExtractedVacancy _self;
  final $Res Function(ExtractedVacancy) _then;

/// Create a copy of ExtractedVacancy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? currency = freezed,Object? employment = freezed,Object? remote = freezed,Object? location = freezed,Object? companyName = freezed,Object? duties = null,Object? requirements = null,Object? conditions = null,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as bool?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,duties: null == duties ? _self.duties : duties // ignore: cast_nullable_to_non_nullable
as List<String>,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>,conditions: null == conditions ? _self.conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtractedVacancy].
extension ExtractedVacancyPatterns on ExtractedVacancy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtractedVacancy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtractedVacancy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtractedVacancy value)  $default,){
final _that = this;
switch (_that) {
case _ExtractedVacancy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtractedVacancy value)?  $default,){
final _that = this;
switch (_that) {
case _ExtractedVacancy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? currency,  String? employment,  bool? remote,  String? location, @JsonKey(name: 'company_name')  String? companyName,  List<String> duties,  List<String> requirements,  List<String> conditions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtractedVacancy() when $default != null:
return $default(_that.title,_that.salaryFrom,_that.salaryTo,_that.currency,_that.employment,_that.remote,_that.location,_that.companyName,_that.duties,_that.requirements,_that.conditions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? currency,  String? employment,  bool? remote,  String? location, @JsonKey(name: 'company_name')  String? companyName,  List<String> duties,  List<String> requirements,  List<String> conditions)  $default,) {final _that = this;
switch (_that) {
case _ExtractedVacancy():
return $default(_that.title,_that.salaryFrom,_that.salaryTo,_that.currency,_that.employment,_that.remote,_that.location,_that.companyName,_that.duties,_that.requirements,_that.conditions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title, @JsonKey(name: 'salary_from')  int? salaryFrom, @JsonKey(name: 'salary_to')  int? salaryTo,  String? currency,  String? employment,  bool? remote,  String? location, @JsonKey(name: 'company_name')  String? companyName,  List<String> duties,  List<String> requirements,  List<String> conditions)?  $default,) {final _that = this;
switch (_that) {
case _ExtractedVacancy() when $default != null:
return $default(_that.title,_that.salaryFrom,_that.salaryTo,_that.currency,_that.employment,_that.remote,_that.location,_that.companyName,_that.duties,_that.requirements,_that.conditions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtractedVacancy implements ExtractedVacancy {
  const _ExtractedVacancy({this.title, @JsonKey(name: 'salary_from') this.salaryFrom, @JsonKey(name: 'salary_to') this.salaryTo, this.currency, this.employment, this.remote, this.location, @JsonKey(name: 'company_name') this.companyName, final  List<String> duties = const <String>[], final  List<String> requirements = const <String>[], final  List<String> conditions = const <String>[]}): _duties = duties,_requirements = requirements,_conditions = conditions;
  factory _ExtractedVacancy.fromJson(Map<String, dynamic> json) => _$ExtractedVacancyFromJson(json);

@override final  String? title;
@override@JsonKey(name: 'salary_from') final  int? salaryFrom;
@override@JsonKey(name: 'salary_to') final  int? salaryTo;
@override final  String? currency;
@override final  String? employment;
@override final  bool? remote;
@override final  String? location;
@override@JsonKey(name: 'company_name') final  String? companyName;
 final  List<String> _duties;
@override@JsonKey() List<String> get duties {
  if (_duties is EqualUnmodifiableListView) return _duties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_duties);
}

 final  List<String> _requirements;
@override@JsonKey() List<String> get requirements {
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirements);
}

 final  List<String> _conditions;
@override@JsonKey() List<String> get conditions {
  if (_conditions is EqualUnmodifiableListView) return _conditions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conditions);
}


/// Create a copy of ExtractedVacancy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtractedVacancyCopyWith<_ExtractedVacancy> get copyWith => __$ExtractedVacancyCopyWithImpl<_ExtractedVacancy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtractedVacancyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtractedVacancy&&(identical(other.title, title) || other.title == title)&&(identical(other.salaryFrom, salaryFrom) || other.salaryFrom == salaryFrom)&&(identical(other.salaryTo, salaryTo) || other.salaryTo == salaryTo)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.employment, employment) || other.employment == employment)&&(identical(other.remote, remote) || other.remote == remote)&&(identical(other.location, location) || other.location == location)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other._duties, _duties)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._conditions, _conditions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,salaryFrom,salaryTo,currency,employment,remote,location,companyName,const DeepCollectionEquality().hash(_duties),const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_conditions));

@override
String toString() {
  return 'ExtractedVacancy(title: $title, salaryFrom: $salaryFrom, salaryTo: $salaryTo, currency: $currency, employment: $employment, remote: $remote, location: $location, companyName: $companyName, duties: $duties, requirements: $requirements, conditions: $conditions)';
}


}

/// @nodoc
abstract mixin class _$ExtractedVacancyCopyWith<$Res> implements $ExtractedVacancyCopyWith<$Res> {
  factory _$ExtractedVacancyCopyWith(_ExtractedVacancy value, $Res Function(_ExtractedVacancy) _then) = __$ExtractedVacancyCopyWithImpl;
@override @useResult
$Res call({
 String? title,@JsonKey(name: 'salary_from') int? salaryFrom,@JsonKey(name: 'salary_to') int? salaryTo, String? currency, String? employment, bool? remote, String? location,@JsonKey(name: 'company_name') String? companyName, List<String> duties, List<String> requirements, List<String> conditions
});




}
/// @nodoc
class __$ExtractedVacancyCopyWithImpl<$Res>
    implements _$ExtractedVacancyCopyWith<$Res> {
  __$ExtractedVacancyCopyWithImpl(this._self, this._then);

  final _ExtractedVacancy _self;
  final $Res Function(_ExtractedVacancy) _then;

/// Create a copy of ExtractedVacancy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? salaryFrom = freezed,Object? salaryTo = freezed,Object? currency = freezed,Object? employment = freezed,Object? remote = freezed,Object? location = freezed,Object? companyName = freezed,Object? duties = null,Object? requirements = null,Object? conditions = null,}) {
  return _then(_ExtractedVacancy(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,salaryFrom: freezed == salaryFrom ? _self.salaryFrom : salaryFrom // ignore: cast_nullable_to_non_nullable
as int?,salaryTo: freezed == salaryTo ? _self.salaryTo : salaryTo // ignore: cast_nullable_to_non_nullable
as int?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,employment: freezed == employment ? _self.employment : employment // ignore: cast_nullable_to_non_nullable
as String?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as bool?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,duties: null == duties ? _self._duties : duties // ignore: cast_nullable_to_non_nullable
as List<String>,requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<String>,conditions: null == conditions ? _self._conditions : conditions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$QueueRecord {

 SearchResultItem get vacancy; ResultCard get card; QueueStatus get status; String get preparedAt;
/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueRecordCopyWith<QueueRecord> get copyWith => _$QueueRecordCopyWithImpl<QueueRecord>(this as QueueRecord, _$identity);

  /// Serializes this QueueRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueRecord&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy)&&(identical(other.card, card) || other.card == card)&&(identical(other.status, status) || other.status == status)&&(identical(other.preparedAt, preparedAt) || other.preparedAt == preparedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vacancy,card,status,preparedAt);

@override
String toString() {
  return 'QueueRecord(vacancy: $vacancy, card: $card, status: $status, preparedAt: $preparedAt)';
}


}

/// @nodoc
abstract mixin class $QueueRecordCopyWith<$Res>  {
  factory $QueueRecordCopyWith(QueueRecord value, $Res Function(QueueRecord) _then) = _$QueueRecordCopyWithImpl;
@useResult
$Res call({
 SearchResultItem vacancy, ResultCard card, QueueStatus status, String preparedAt
});


$SearchResultItemCopyWith<$Res> get vacancy;$ResultCardCopyWith<$Res> get card;

}
/// @nodoc
class _$QueueRecordCopyWithImpl<$Res>
    implements $QueueRecordCopyWith<$Res> {
  _$QueueRecordCopyWithImpl(this._self, this._then);

  final QueueRecord _self;
  final $Res Function(QueueRecord) _then;

/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vacancy = null,Object? card = null,Object? status = null,Object? preparedAt = null,}) {
  return _then(_self.copyWith(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as SearchResultItem,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as ResultCard,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QueueStatus,preparedAt: null == preparedAt ? _self.preparedAt : preparedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultItemCopyWith<$Res> get vacancy {
  
  return $SearchResultItemCopyWith<$Res>(_self.vacancy, (value) {
    return _then(_self.copyWith(vacancy: value));
  });
}/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCardCopyWith<$Res> get card {
  
  return $ResultCardCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}


/// Adds pattern-matching-related methods to [QueueRecord].
extension QueueRecordPatterns on QueueRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueRecord value)  $default,){
final _that = this;
switch (_that) {
case _QueueRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueRecord value)?  $default,){
final _that = this;
switch (_that) {
case _QueueRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SearchResultItem vacancy,  ResultCard card,  QueueStatus status,  String preparedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueRecord() when $default != null:
return $default(_that.vacancy,_that.card,_that.status,_that.preparedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SearchResultItem vacancy,  ResultCard card,  QueueStatus status,  String preparedAt)  $default,) {final _that = this;
switch (_that) {
case _QueueRecord():
return $default(_that.vacancy,_that.card,_that.status,_that.preparedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SearchResultItem vacancy,  ResultCard card,  QueueStatus status,  String preparedAt)?  $default,) {final _that = this;
switch (_that) {
case _QueueRecord() when $default != null:
return $default(_that.vacancy,_that.card,_that.status,_that.preparedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueRecord implements QueueRecord {
  const _QueueRecord({required this.vacancy, required this.card, this.status = QueueStatus.ready, required this.preparedAt});
  factory _QueueRecord.fromJson(Map<String, dynamic> json) => _$QueueRecordFromJson(json);

@override final  SearchResultItem vacancy;
@override final  ResultCard card;
@override@JsonKey() final  QueueStatus status;
@override final  String preparedAt;

/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueRecordCopyWith<_QueueRecord> get copyWith => __$QueueRecordCopyWithImpl<_QueueRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueRecord&&(identical(other.vacancy, vacancy) || other.vacancy == vacancy)&&(identical(other.card, card) || other.card == card)&&(identical(other.status, status) || other.status == status)&&(identical(other.preparedAt, preparedAt) || other.preparedAt == preparedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vacancy,card,status,preparedAt);

@override
String toString() {
  return 'QueueRecord(vacancy: $vacancy, card: $card, status: $status, preparedAt: $preparedAt)';
}


}

/// @nodoc
abstract mixin class _$QueueRecordCopyWith<$Res> implements $QueueRecordCopyWith<$Res> {
  factory _$QueueRecordCopyWith(_QueueRecord value, $Res Function(_QueueRecord) _then) = __$QueueRecordCopyWithImpl;
@override @useResult
$Res call({
 SearchResultItem vacancy, ResultCard card, QueueStatus status, String preparedAt
});


@override $SearchResultItemCopyWith<$Res> get vacancy;@override $ResultCardCopyWith<$Res> get card;

}
/// @nodoc
class __$QueueRecordCopyWithImpl<$Res>
    implements _$QueueRecordCopyWith<$Res> {
  __$QueueRecordCopyWithImpl(this._self, this._then);

  final _QueueRecord _self;
  final $Res Function(_QueueRecord) _then;

/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vacancy = null,Object? card = null,Object? status = null,Object? preparedAt = null,}) {
  return _then(_QueueRecord(
vacancy: null == vacancy ? _self.vacancy : vacancy // ignore: cast_nullable_to_non_nullable
as SearchResultItem,card: null == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as ResultCard,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QueueStatus,preparedAt: null == preparedAt ? _self.preparedAt : preparedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchResultItemCopyWith<$Res> get vacancy {
  
  return $SearchResultItemCopyWith<$Res>(_self.vacancy, (value) {
    return _then(_self.copyWith(vacancy: value));
  });
}/// Create a copy of QueueRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCardCopyWith<$Res> get card {
  
  return $ResultCardCopyWith<$Res>(_self.card, (value) {
    return _then(_self.copyWith(card: value));
  });
}
}

// dart format on
