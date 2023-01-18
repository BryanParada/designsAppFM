import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {

    final Color whiteColor = Colors.white.withOpacity(0.7);

    return Stack(
      children: <Widget>[
        _IconHeaderBackground(),

        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(FontAwesomeIcons.plus, size: 250, color: Colors.white.withOpacity(0.2),)
          ),

          Column(
            children: <Widget>[
              SizedBox(height: 80, width: double.infinity,),
              Text('You have requested', style: TextStyle(fontSize: 25, color: whiteColor)),
              SizedBox(height: 20,),
              Text('Medical Assistence', style: TextStyle(fontSize: 30, color: whiteColor, fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white)
            ],
          ),
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff526BF6),
            Color(0xff67ACF2),
          ]
        )
      ),
    );
  }
}