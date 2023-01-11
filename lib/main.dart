
import 'package:designs_backgrounds/src/pages/animations_page.dart';
import 'package:designs_backgrounds/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: AnimationsPage()
    );
  }
}