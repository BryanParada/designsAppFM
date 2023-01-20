import 'package:designs_backgrounds/src/theme/themechanger.dart';
import 'package:designs_backgrounds/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {

    final accentColor = Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;

    return Scaffold(
      body: HeaderWave( accentColor)
    );
  }
}