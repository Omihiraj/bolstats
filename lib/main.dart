import 'package:flutter/material.dart';

import 'page_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BolStats',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const PageHandler(),
    );
  }
}
