import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/api_client.dart';
import '../models/models.dart';
import 'providers.dart';

class SearchState {
  const SearchState({this.loading = false, this.result, this.error, this.lastQuery});

  final bool loading;
  final SearchResult? result;
  final String? error;
  final SearchRequestBody? lastQuery;

  SearchState copyWith({
    bool? loading,
    SearchResult? result,
    String? error,
    bool clearError = false,
    SearchRequestBody? lastQuery,
  }) {
    return SearchState(
      loading: loading ?? this.loading,
      result: result ?? this.result,
      error: clearError ? null : (error ?? this.error),
      lastQuery: lastQuery ?? this.lastQuery,
    );
  }
}

class SearchNotifier extends Notifier<SearchState> {
  @override
  SearchState build() => const SearchState();

  Future<void> runSearch(SearchRequestBody query) async {
    state = state.copyWith(loading: true, clearError: true, lastQuery: query);
    try {
      final result = await ref.read(apiClientProvider).search(query);
      state = state.copyWith(loading: false, result: result, clearError: true);
    } on ApiException catch (e) {
      state = state.copyWith(loading: false, error: e.message);
    } catch (e) {
      state = state.copyWith(loading: false, error: 'Не удалось выполнить поиск: $e');
    }
  }
}

final searchProvider = NotifierProvider<SearchNotifier, SearchState>(SearchNotifier.new);
