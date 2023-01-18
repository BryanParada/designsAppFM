import 'package:designs_backgrounds/src/widgets/header_emergency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        subtitle: 'You have requested',
        title: 'Medical Assistance',
        color1: Color(0xff526bf6),
        color2: Color(0xff67ACF2),
      )
   );
  }
}