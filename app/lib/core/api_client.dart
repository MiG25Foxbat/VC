import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';
import 'app_config.dart';

/// Источник вакансии не подключён или недоступен — сервер сам не роняет
/// ответ целиком, этот класс для сетевых и протокольных ошибок клиента.
class ApiException implements Exception {
  ApiException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Тонкий клиент над четырьмя эндпоинтами. Никакой бизнес-логики —
/// она в провайдерах, здесь только HTTP и разбор JSON.
class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Uri _uri(String path) => Uri.parse('${AppConfig.baseUrl}$path');

  Map<String, String> get _jsonHeaders => const {'Content-Type': 'application/json'};

  Future<bool> health() async {
    try {
      final resp = await _client.get(_uri('/health')).timeout(const Duration(seconds: 20));
      return resp.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  /// Таймаут заметно больше, чем сам /search обычно занимает: бесплатный
  /// Render засыпает через 15 минут простоя, и холодный старт перед
  /// первым запросом за сессию может съесть 30-50 секунд сам по себе,
  /// до того как сервис вообще начнёт обрабатывать поиск.
  Future<SearchResult> search(SearchRequestBody body) async {
    final resp = await _client
        .post(_uri('/search'), headers: _jsonHeaders, body: jsonEncode(body.toJson()))
        .timeout(const Duration(seconds: 70));
    _ensureOk(resp);
    return SearchResult.fromJson(jsonDecode(utf8.decode(resp.bodyBytes)) as Map<String, dynamic>);
  }

  /// /prepare — тяжёлая операция (обогащение + модель), до минуты.
  /// Таймаут клиента чуть шире, чем обещание сервера: холодный старт
  /// Render после сна добавляет свои секунды сверху.
  Future<ResultCard> prepare(PrepareRequestBody body) async {
    final resp = await _client
        .post(_uri('/prepare'), headers: _jsonHeaders, body: jsonEncode(body.toJson()))
        .timeout(const Duration(seconds: 90));
    _ensureOk(resp);
    return ResultCard.fromJson(jsonDecode(utf8.decode(resp.bodyBytes)) as Map<String, dynamic>);
  }

  Future<void> forget(String cacheKey) async {
    final resp = await _client
        .post(
          _uri('/forget'),
          headers: _jsonHeaders,
          body: jsonEncode({'cache_key': cacheKey}),
        )
        .timeout(const Duration(seconds: 20));
    _ensureOk(resp);
  }

  void _ensureOk(http.Response resp) {
    if (resp.statusCode >= 200 && resp.statusCode < 300) return;
    String detail = resp.body;
    try {
      final decoded = jsonDecode(utf8.decode(resp.bodyBytes));
      if (decoded is Map && decoded['error'] is Map) {
        detail = (decoded['error']['message'] ?? detail).toString();
      }
    } catch (_) {
      // тело не JSON — оставляем как есть
    }
    throw ApiException('${resp.statusCode}: $detail');
  }
}
