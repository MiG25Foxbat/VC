import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_state.dart';

const _template = '''
name: Имя Фамилия
contacts:
  telegram: "@nickname"
  email: "почта@example.com"
  phone: "+7 000 000-00-00"
location: Москва
format: удалённо, около 35 часов в неделю
languages:
  - русский родной
skills:
  automation: [Python, SQL]
achievements:
  - text: пример достижения с цифрой
    number: 100
experience:
  - role: Должность
    org: Компания
    period: "2024 — настоящее время"
    points:
      - что делала
''';

/// Профиль кандидата уходит на сервер с каждым /prepare — бэкенд его
/// не хранит (server/profiles/*.yaml не в git), поэтому единственное
/// живое место для этих данных — устройство пользователя.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _controller = TextEditingController();
  bool _initialized = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    await ref.read(profileProvider.notifier).save(_controller.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Профиль сохранён на устройстве')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(profileProvider);
    async.whenData((value) {
      if (!_initialized) {
        _controller.text = value.isEmpty ? _template : value;
        _initialized = true;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль кандидата'),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _save),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Ошибка: $e')),
        data: (_) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Этот текст целиком уходит модели при подготовке письма. '
                'Формат — как в server/profiles/example.yaml из репозитория.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
