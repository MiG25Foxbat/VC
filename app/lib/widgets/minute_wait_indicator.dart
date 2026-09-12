import 'dart:async';

import 'package:flutter/material.dart';

/// /prepare — тяжёлая операция (обогащение по ИНН + две модели), пока
/// сервер не ответит, это до минуты, а после сна Render — и больше.
/// Простой виджет с тикающим таймером — setState тут уместен, состояние
/// чисто визуальное и никуда за пределы экрана не уходит.
class MinuteWaitIndicator extends StatefulWidget {
  const MinuteWaitIndicator({super.key});

  @override
  State<MinuteWaitIndicator> createState() => _MinuteWaitIndicatorState();
}

class _MinuteWaitIndicatorState extends State<MinuteWaitIndicator> {
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _seconds++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slow = _seconds > 50;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Собираем карточку: ищем компанию по ИНН и пишем письмо.\n'
            'Обычно это занимает до минуты.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Прошло: $_seconds сек'
            '${slow ? ' — сервер, возможно, просыпается после сна' : ''}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
