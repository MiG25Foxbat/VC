// Модели данных. Повторяют контракт из docs/BUILD.md раздела 3 и
// эндпоинтов /search, /prepare. Имена полей на сервере — snake_case,
// здесь — camelCase через @JsonKey, один-в-один без переименований смысла.
//
// ignore_for_file: invalid_annotation_target
// @JsonKey на параметрах factory-конструктора — штатный способ работы
// с freezed, анализатор просто не знает про этот случай.
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class Vacancy with _$Vacancy {
  const factory Vacancy({
    required String id,
    required String title,
    @JsonKey(name: 'salary_from') int? salaryFrom,
    @JsonKey(name: 'salary_to') int? salaryTo,
    String? currency,
    String? employment,
    bool? remote,
    String? location,
    required String url,
    @JsonKey(name: 'published_at') String? publishedAt,
    String? description,
    required String source,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_inn') String? companyInn,
  }) = _Vacancy;

  factory Vacancy.fromJson(Map<String, dynamic> json) => _$VacancyFromJson(json);
}

@freezed
abstract class FinanceYear with _$FinanceYear {
  const factory FinanceYear({
    required int year,
    int? revenue,
    int? profit,
  }) = _FinanceYear;

  factory FinanceYear.fromJson(Map<String, dynamic> json) => _$FinanceYearFromJson(json);
}

@freezed
abstract class Company with _$Company {
  const factory Company({
    @JsonKey(name: 'legal_name') String? legalName,
    String? inn,
    String? ogrn,
    @JsonKey(name: 'registered_at') String? registeredAt,
    String? okved,
    String? address,
    String? status,
    String? site,
    @Default(<FinanceYear>[]) List<FinanceYear> finance,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}

@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    String? email,
    @JsonKey(name: 'email_is_role') bool? emailIsRole,
    String? phone,
    @JsonKey(name: 'phone_region') String? phoneRegion,
    @JsonKey(name: 'phone_timezone') String? phoneTimezone,
    String? telegram,
    String? page,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}

@freezed
abstract class Signal with _$Signal {
  const factory Signal({
    required String text,
    required String url,
    String? date,
  }) = _Signal;

  factory Signal.fromJson(Map<String, dynamic> json) => _$SignalFromJson(json);
}

@freezed
abstract class Owner with _$Owner {
  const factory Owner({
    @JsonKey(name: 'full_name') String? fullName,
    String? gender,
    String? role,
    String? source,
    Contact? contacts,
    @Default(<Signal>[]) List<Signal> signals,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@freezed
abstract class Review with _$Review {
  const factory Review({
    required String source,
    double? rating,
    int? count,
    String? summary,
    String? url,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
abstract class LetterFact with _$LetterFact {
  const factory LetterFact({
    required String claim,
    @JsonKey(name: 'source_url') required String sourceUrl,
  }) = _LetterFact;

  factory LetterFact.fromJson(Map<String, dynamic> json) => _$LetterFactFromJson(json);
}

@freezed
abstract class Letter with _$Letter {
  const factory Letter({
    required String text,
    @Default(<LetterFact>[]) List<LetterFact> facts,
  }) = _Letter;

  factory Letter.fromJson(Map<String, dynamic> json) => _$LetterFromJson(json);
}

@freezed
abstract class Brief with _$Brief {
  const factory Brief({
    @Default(<String>[]) List<String> questions,
    @JsonKey(name: 'likely_test') String? likelyTest,
    @JsonKey(name: 'salary_range') String? salaryRange,
    @JsonKey(name: 'red_flags') @Default(<String>[]) List<String> redFlags,
  }) = _Brief;

  factory Brief.fromJson(Map<String, dynamic> json) => _$BriefFromJson(json);
}

@freezed
abstract class Confidence with _$Confidence {
  const factory Confidence({
    @Default(0.0) double company,
    @Default(0.0) double owner,
    @Default(0.0) double reviews,
  }) = _Confidence;

  factory Confidence.fromJson(Map<String, dynamic> json) => _$ConfidenceFromJson(json);
}

@freezed
abstract class CardMeta with _$CardMeta {
  const factory CardMeta({
    @Default(Confidence()) Confidence confidence,
    @JsonKey(name: 'cache_key') required String cacheKey,
    @JsonKey(name: 'expires_at') required String expiresAt,
  }) = _CardMeta;

  factory CardMeta.fromJson(Map<String, dynamic> json) => _$CardMetaFromJson(json);
}

@freezed
abstract class ResultCard with _$ResultCard {
  const factory ResultCard({
    required Vacancy vacancy,
    Company? company,
    Owner? owner,
    @Default(<Review>[]) List<Review> reviews,
    Letter? letter,
    Brief? brief,
    required CardMeta meta,
  }) = _ResultCard;

  factory ResultCard.fromJson(Map<String, dynamic> json) => _$ResultCardFromJson(json);
}

/// Облегчённая карточка из /search — то, что реально отдаёт эндпоинт,
/// не путать с Vacancy (внутреннее представление сервера).
@freezed
abstract class SearchResultItem with _$SearchResultItem {
  const factory SearchResultItem({
    required String id,
    required String title,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_inn') String? companyInn,
    @JsonKey(name: 'salary_from') int? salaryFrom,
    @JsonKey(name: 'salary_to') int? salaryTo,
    String? location,
    required String url,
    @JsonKey(name: 'published_at') String? publishedAt,
    String? description,
    required String source,
  }) = _SearchResultItem;

  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
}

@freezed
abstract class SearchSourceError with _$SearchSourceError {
  const factory SearchSourceError({
    required String source,
    required String reason,
  }) = _SearchSourceError;

  factory SearchSourceError.fromJson(Map<String, dynamic> json) =>
      _$SearchSourceErrorFromJson(json);
}

@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({
    @Default(<SearchResultItem>[]) List<SearchResultItem> items,
    @Default(<SearchSourceError>[]) List<SearchSourceError> errors,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);
}

@freezed
abstract class SearchRequestBody with _$SearchRequestBody {
  const factory SearchRequestBody({
    required String query,
    String? region,
    bool? remote,
    @JsonKey(name: 'salary_from') int? salaryFrom,
    List<String>? sources,
    @Default(20) int limit,
  }) = _SearchRequestBody;

  factory SearchRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestBodyFromJson(json);
}

@freezed
abstract class PrepareRequestBody with _$PrepareRequestBody {
  const factory PrepareRequestBody({
    @JsonKey(name: 'vacancy_id') required String vacancyId,
    required String source,
    @JsonKey(name: 'profile_id') @Default('default') String profileId,
    @JsonKey(name: 'profile_text') String? profileText,
    required String title,
    required String url,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_inn') String? companyInn,
    @JsonKey(name: 'salary_from') int? salaryFrom,
    @JsonKey(name: 'salary_to') int? salaryTo,
    String? location,
    @JsonKey(name: 'published_at') String? publishedAt,
    String? description,
  }) = _PrepareRequestBody;

  factory PrepareRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PrepareRequestBodyFromJson(json);
}

@freezed
abstract class ExtractRequestBody with _$ExtractRequestBody {
  const factory ExtractRequestBody({
    @JsonKey(name: 'raw_text') required String rawText,
  }) = _ExtractRequestBody;

  factory ExtractRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ExtractRequestBodyFromJson(json);
}

/// Результат /extract — то же самое, что отдаёт /search по форме полей,
/// чтобы можно было передать прямо в /prepare без переименований.
@freezed
abstract class ExtractedVacancy with _$ExtractedVacancy {
  const factory ExtractedVacancy({
    String? title,
    @JsonKey(name: 'salary_from') int? salaryFrom,
    @JsonKey(name: 'salary_to') int? salaryTo,
    String? currency,
    String? employment,
    bool? remote,
    String? location,
    @JsonKey(name: 'company_name') String? companyName,
    @Default(<String>[]) List<String> duties,
    @Default(<String>[]) List<String> requirements,
    @Default(<String>[]) List<String> conditions,
  }) = _ExtractedVacancy;

  factory ExtractedVacancy.fromJson(Map<String, dynamic> json) =>
      _$ExtractedVacancyFromJson(json);
}

/// Статус карточки в очереди отправки. Хранится только на клиенте —
/// сервер про "отправлено"/"отказ" не знает, только про истечение TTL.
enum QueueStatus { ready, sent, declined }

@freezed
abstract class QueueRecord with _$QueueRecord {
  const factory QueueRecord({
    required SearchResultItem vacancy,
    required ResultCard card,
    @Default(QueueStatus.ready) QueueStatus status,
    required String preparedAt,
  }) = _QueueRecord;

  factory QueueRecord.fromJson(Map<String, dynamic> json) => _$QueueRecordFromJson(json);
}
