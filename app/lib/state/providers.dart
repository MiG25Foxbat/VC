import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/api_client.dart';
import '../storage/prepared_cards_store.dart';
import '../storage/profile_store.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final preparedCardsStoreProvider = Provider<PreparedCardsStore>((ref) => PreparedCardsStore());

final profileStoreProvider = Provider<ProfileStore>((ref) => ProfileStore());
