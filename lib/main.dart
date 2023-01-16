
//import 'package:designs_backgrounds/src/pages/animations_page.dart';
//import 'package:designs_backgrounds/src/pages/headers_page.dart';
//import 'package:designs_backgrounds/src/labs/circular_progress_page.dart';
//import 'package:designs_backgrounds/src/pages/graphs_circular_page.dart';
import 'package:designs_backgrounds/src/pages/slideshow.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: SlideShowPage()
    );
  }
}