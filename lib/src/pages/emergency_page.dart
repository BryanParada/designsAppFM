import 'package:designs_backgrounds/src/widgets/big_button.dart';
import 'package:designs_backgrounds/src/widgets/header_emergency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Center(
        child: BigButton(
          icon: FontAwesomeIcons.carBurst,
          text: 'Motor Accident!',
          color1: Color(0xff6989F5),
          color2: Color(0xff906EF5),
          onPressed: (){ print('Click');} ,
        ),
      )
   );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'You have requested',
      title: 'Medical Assistance',
      color1: Color(0xff526bf6),
      color2: Color(0xff67ACF2),
    );
  }
}