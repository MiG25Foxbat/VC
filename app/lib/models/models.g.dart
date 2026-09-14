// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vacancy _$VacancyFromJson(Map<String, dynamic> json) => _Vacancy(
  id: json['id'] as String,
  title: json['title'] as String,
  salaryFrom: (json['salary_from'] as num?)?.toInt(),
  salaryTo: (json['salary_to'] as num?)?.toInt(),
  currency: json['currency'] as String?,
  employment: json['employment'] as String?,
  remote: json['remote'] as bool?,
  location: json['location'] as String?,
  url: json['url'] as String,
  publishedAt: json['published_at'] as String?,
  description: json['description'] as String?,
  source: json['source'] as String,
  companyName: json['company_name'] as String?,
  companyInn: json['company_inn'] as String?,
);

Map<String, dynamic> _$VacancyToJson(_Vacancy instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'salary_from': instance.salaryFrom,
  'salary_to': instance.salaryTo,
  'currency': instance.currency,
  'employment': instance.employment,
  'remote': instance.remote,
  'location': instance.location,
  'url': instance.url,
  'published_at': instance.publishedAt,
  'description': instance.description,
  'source': instance.source,
  'company_name': instance.companyName,
  'company_inn': instance.companyInn,
};

_FinanceYear _$FinanceYearFromJson(Map<String, dynamic> json) => _FinanceYear(
  year: (json['year'] as num).toInt(),
  revenue: (json['revenue'] as num?)?.toInt(),
  profit: (json['profit'] as num?)?.toInt(),
);

Map<String, dynamic> _$FinanceYearToJson(_FinanceYear instance) =>
    <String, dynamic>{
      'year': instance.year,
      'revenue': instance.revenue,
      'profit': instance.profit,
    };

_Company _$CompanyFromJson(Map<String, dynamic> json) => _Company(
  legalName: json['legal_name'] as String?,
  inn: json['inn'] as String?,
  ogrn: json['ogrn'] as String?,
  registeredAt: json['registered_at'] as String?,
  okved: json['okved'] as String?,
  address: json['address'] as String?,
  status: json['status'] as String?,
  site: json['site'] as String?,
  finance:
      (json['finance'] as List<dynamic>?)
          ?.map((e) => FinanceYear.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FinanceYear>[],
);

Map<String, dynamic> _$CompanyToJson(_Company instance) => <String, dynamic>{
  'legal_name': instance.legalName,
  'inn': instance.inn,
  'ogrn': instance.ogrn,
  'registered_at': instance.registeredAt,
  'okved': instance.okved,
  'address': instance.address,
  'status': instance.status,
  'site': instance.site,
  'finance': instance.finance,
};

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  email: json['email'] as String?,
  emailIsRole: json['email_is_role'] as bool?,
  phone: json['phone'] as String?,
  phoneRegion: json['phone_region'] as String?,
  phoneTimezone: json['phone_timezone'] as String?,
  telegram: json['telegram'] as String?,
  page: json['page'] as String?,
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'email': instance.email,
  'email_is_role': instance.emailIsRole,
  'phone': instance.phone,
  'phone_region': instance.phoneRegion,
  'phone_timezone': instance.phoneTimezone,
  'telegram': instance.telegram,
  'page': instance.page,
};

_Signal _$SignalFromJson(Map<String, dynamic> json) => _Signal(
  text: json['text'] as String,
  url: json['url'] as String,
  date: json['date'] as String?,
);

Map<String, dynamic> _$SignalToJson(_Signal instance) => <String, dynamic>{
  'text': instance.text,
  'url': instance.url,
  'date': instance.date,
};

_Owner _$OwnerFromJson(Map<String, dynamic> json) => _Owner(
  fullName: json['full_name'] as String?,
  gender: json['gender'] as String?,
  role: json['role'] as String?,
  source: json['source'] as String?,
  contacts:
      json['contacts'] == null
          ? null
          : Contact.fromJson(json['contacts'] as Map<String, dynamic>),
  signals:
      (json['signals'] as List<dynamic>?)
          ?.map((e) => Signal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Signal>[],
);

Map<String, dynamic> _$OwnerToJson(_Owner instance) => <String, dynamic>{
  'full_name': instance.fullName,
  'gender': instance.gender,
  'role': instance.role,
  'source': instance.source,
  'contacts': instance.contacts,
  'signals': instance.signals,
};

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  source: json['source'] as String,
  rating: (json['rating'] as num?)?.toDouble(),
  count: (json['count'] as num?)?.toInt(),
  summary: json['summary'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'source': instance.source,
  'rating': instance.rating,
  'count': instance.count,
  'summary': instance.summary,
  'url': instance.url,
};

_LetterFact _$LetterFactFromJson(Map<String, dynamic> json) => _LetterFact(
  claim: json['claim'] as String,
  sourceUrl: json['source_url'] as String,
);

Map<String, dynamic> _$LetterFactToJson(_LetterFact instance) =>
    <String, dynamic>{
      'claim': instance.claim,
      'source_url': instance.sourceUrl,
    };

_Letter _$LetterFromJson(Map<String, dynamic> json) => _Letter(
  text: json['text'] as String,
  facts:
      (json['facts'] as List<dynamic>?)
          ?.map((e) => LetterFact.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LetterFact>[],
);

Map<String, dynamic> _$LetterToJson(_Letter instance) => <String, dynamic>{
  'text': instance.text,
  'facts': instance.facts,
};

_Brief _$BriefFromJson(Map<String, dynamic> json) => _Brief(
  questions:
      (json['questions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  likelyTest: json['likely_test'] as String?,
  salaryRange: json['salary_range'] as String?,
  redFlags:
      (json['red_flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$BriefToJson(_Brief instance) => <String, dynamic>{
  'questions': instance.questions,
  'likely_test': instance.likelyTest,
  'salary_range': instance.salaryRange,
  'red_flags': instance.redFlags,
};

_Confidence _$ConfidenceFromJson(Map<String, dynamic> json) => _Confidence(
  company: (json['company'] as num?)?.toDouble() ?? 0.0,
  owner: (json['owner'] as num?)?.toDouble() ?? 0.0,
  reviews: (json['reviews'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ConfidenceToJson(_Confidence instance) =>
    <String, dynamic>{
      'company': instance.company,
      'owner': instance.owner,
      'reviews': instance.reviews,
    };

_CardMeta _$CardMetaFromJson(Map<String, dynamic> json) => _CardMeta(
  confidence:
      json['confidence'] == null
          ? const Confidence()
          : Confidence.fromJson(json['confidence'] as Map<String, dynamic>),
  cacheKey: json['cache_key'] as String,
  expiresAt: json['expires_at'] as String,
);

Map<String, dynamic> _$CardMetaToJson(_CardMeta instance) => <String, dynamic>{
  'confidence': instance.confidence,
  'cache_key': instance.cacheKey,
  'expires_at': instance.expiresAt,
};

_ResultCard _$ResultCardFromJson(Map<String, dynamic> json) => _ResultCard(
  vacancy: Vacancy.fromJson(json['vacancy'] as Map<String, dynamic>),
  company:
      json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
  owner:
      json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Review>[],
  letter:
      json['letter'] == null
          ? null
          : Letter.fromJson(json['letter'] as Map<String, dynamic>),
  brief:
      json['brief'] == null
          ? null
          : Brief.fromJson(json['brief'] as Map<String, dynamic>),
  meta: CardMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResultCardToJson(_ResultCard instance) =>
    <String, dynamic>{
      'vacancy': instance.vacancy,
      'company': instance.company,
      'owner': instance.owner,
      'reviews': instance.reviews,
      'letter': instance.letter,
      'brief': instance.brief,
      'meta': instance.meta,
    };

_SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) =>
    _SearchResultItem(
      id: json['id'] as String,
      title: json['title'] as String,
      companyName: json['company_name'] as String?,
      companyInn: json['company_inn'] as String?,
      salaryFrom: (json['salary_from'] as num?)?.toInt(),
      salaryTo: (json['salary_to'] as num?)?.toInt(),
      location: json['location'] as String?,
      url: json['url'] as String,
      publishedAt: json['published_at'] as String?,
      description: json['description'] as String?,
      source: json['source'] as String,
    );

Map<String, dynamic> _$SearchResultItemToJson(_SearchResultItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company_name': instance.companyName,
      'company_inn': instance.companyInn,
      'salary_from': instance.salaryFrom,
      'salary_to': instance.salaryTo,
      'location': instance.location,
      'url': instance.url,
      'published_at': instance.publishedAt,
      'description': instance.description,
      'source': instance.source,
    };

_SearchSourceError _$SearchSourceErrorFromJson(Map<String, dynamic> json) =>
    _SearchSourceError(
      source: json['source'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$SearchSourceErrorToJson(_SearchSourceError instance) =>
    <String, dynamic>{'source': instance.source, 'reason': instance.reason};

_SearchResult _$SearchResultFromJson(Map<String, dynamic> json) =>
    _SearchResult(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SearchResultItem>[],
      errors:
          (json['errors'] as List<dynamic>?)
              ?.map(
                (e) => SearchSourceError.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <SearchSourceError>[],
    );

Map<String, dynamic> _$SearchResultToJson(_SearchResult instance) =>
    <String, dynamic>{'items': instance.items, 'errors': instance.errors};

_SearchRequestBody _$SearchRequestBodyFromJson(Map<String, dynamic> json) =>
    _SearchRequestBody(
      query: json['query'] as String,
      region: json['region'] as String?,
      remote: json['remote'] as bool?,
      salaryFrom: (json['salary_from'] as num?)?.toInt(),
      sources:
          (json['sources'] as List<dynamic>?)?.map((e) => e as String).toList(),
      limit: (json['limit'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$SearchRequestBodyToJson(_SearchRequestBody instance) =>
    <String, dynamic>{
      'query': instance.query,
      'region': instance.region,
      'remote': instance.remote,
      'salary_from': instance.salaryFrom,
      'sources': instance.sources,
      'limit': instance.limit,
    };

_PrepareRequestBody _$PrepareRequestBodyFromJson(Map<String, dynamic> json) =>
    _PrepareRequestBody(
      vacancyId: json['vacancy_id'] as String,
      source: json['source'] as String,
      profileId: json['profile_id'] as String? ?? 'default',
      profileText: json['profile_text'] as String?,
      title: json['title'] as String,
      url: json['url'] as String,
      companyName: json['company_name'] as String?,
      companyInn: json['company_inn'] as String?,
      salaryFrom: (json['salary_from'] as num?)?.toInt(),
      salaryTo: (json['salary_to'] as num?)?.toInt(),
      location: json['location'] as String?,
      publishedAt: json['published_at'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PrepareRequestBodyToJson(_PrepareRequestBody instance) =>
    <String, dynamic>{
      'vacancy_id': instance.vacancyId,
      'source': instance.source,
      'profile_id': instance.profileId,
      'profile_text': instance.profileText,
      'title': instance.title,
      'url': instance.url,
      'company_name': instance.companyName,
      'company_inn': instance.companyInn,
      'salary_from': instance.salaryFrom,
      'salary_to': instance.salaryTo,
      'location': instance.location,
      'published_at': instance.publishedAt,
      'description': instance.description,
    };

_ExtractRequestBody _$ExtractRequestBodyFromJson(Map<String, dynamic> json) =>
    _ExtractRequestBody(rawText: json['raw_text'] as String);

Map<String, dynamic> _$ExtractRequestBodyToJson(_ExtractRequestBody instance) =>
    <String, dynamic>{'raw_text': instance.rawText};

_ExtractedVacancy _$ExtractedVacancyFromJson(Map<String, dynamic> json) =>
    _ExtractedVacancy(
      title: json['title'] as String?,
      salaryFrom: (json['salary_from'] as num?)?.toInt(),
      salaryTo: (json['salary_to'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      employment: json['employment'] as String?,
      remote: json['remote'] as bool?,
      location: json['location'] as String?,
      companyName: json['company_name'] as String?,
      duties:
          (json['duties'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      requirements:
          (json['requirements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      conditions:
          (json['conditions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$ExtractedVacancyToJson(_ExtractedVacancy instance) =>
    <String, dynamic>{
      'title': instance.title,
      'salary_from': instance.salaryFrom,
      'salary_to': instance.salaryTo,
      'currency': instance.currency,
      'employment': instance.employment,
      'remote': instance.remote,
      'location': instance.location,
      'company_name': instance.companyName,
      'duties': instance.duties,
      'requirements': instance.requirements,
      'conditions': instance.conditions,
    };

_QueueRecord _$QueueRecordFromJson(Map<String, dynamic> json) => _QueueRecord(
  vacancy: SearchResultItem.fromJson(json['vacancy'] as Map<String, dynamic>),
  card: ResultCard.fromJson(json['card'] as Map<String, dynamic>),
  status:
      $enumDecodeNullable(_$QueueStatusEnumMap, json['status']) ??
      QueueStatus.ready,
  preparedAt: json['preparedAt'] as String,
);

Map<String, dynamic> _$QueueRecordToJson(_QueueRecord instance) =>
    <String, dynamic>{
      'vacancy': instance.vacancy,
      'card': instance.card,
      'status': _$QueueStatusEnumMap[instance.status]!,
      'preparedAt': instance.preparedAt,
    };

const _$QueueStatusEnumMap = {
  QueueStatus.ready: 'ready',
  QueueStatus.sent: 'sent',
  QueueStatus.declined: 'declined',
};
