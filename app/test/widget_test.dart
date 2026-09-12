import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:agent_otklikov/app.dart';

void main() {
  testWidgets('Приложение стартует на экране поиска', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const ProviderScope(child: AgentOtklikovApp()));
    await tester.pumpAndSettle();

    expect(find.text('Поиск вакансий'), findsOneWidget);
    expect(find.text('Поиск'), findsWidgets);
    expect(find.text('Лента'), findsWidgets);
    expect(find.text('Очередь'), findsWidgets);
  });
}
