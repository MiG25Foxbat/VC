import 'package:flutter/material.dart';

import 'feed_screen.dart';
import 'paste_vacancy_screen.dart';
import 'queue_screen.dart';
import 'search_screen.dart';

/// Четыре постоянные вкладки — поиск, лента, вставка текста, очередь.
/// Карточка с письмом — не вкладка, а экран, на который переходят по
/// конкретной вакансии.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  void _goToFeed() => setState(() => _index = 1);

  @override
  Widget build(BuildContext context) {
    final screens = [
      SearchScreen(onSearched: _goToFeed),
      const FeedScreen(),
      const PasteVacancyScreen(),
      const QueueScreen(),
    ];
    return Scaffold(
      body: IndexedStack(index: _index, children: screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.search), label: 'Поиск'),
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Лента'),
          NavigationDestination(icon: Icon(Icons.paste), label: 'Вставить'),
          NavigationDestination(icon: Icon(Icons.outbox), label: 'Очередь'),
        ],
      ),
    );
  }
}
