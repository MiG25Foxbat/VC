import 'package:flutter/material.dart';

import 'screens/home_shell.dart';

class AgentOtklikovApp extends StatelessWidget {
  const AgentOtklikovApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Агент откликов',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomeShell(),
      debugShowCheckedModeBanner: false,
    );
  }
}
