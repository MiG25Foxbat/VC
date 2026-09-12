import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

class ProfileNotifier extends AsyncNotifier<String> {
  @override
  Future<String> build() => ref.read(profileStoreProvider).load();

  Future<void> save(String yamlText) async {
    await ref.read(profileStoreProvider).save(yamlText);
    state = AsyncData(yamlText);
  }
}

final profileProvider = AsyncNotifierProvider<ProfileNotifier, String>(ProfileNotifier.new);
