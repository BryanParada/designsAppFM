import 'package:animate_do/animate_do.dart';
import 'package:designs_backgrounds/src/widgets/big_button.dart';
import 'package:designs_backgrounds/src/widgets/header_emergency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ItemButton {

  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemButton( this.icon, this.text, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {


final items = <ItemButton>[
  new ItemButton( FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
  new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
  new ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
  new ItemButton( FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  new ItemButton( FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
  new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
  new ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
  new ItemButton( FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  new ItemButton( FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
  new ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
  new ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
  new ItemButton( FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
];

List<Widget> itemMap = items.map(
  (item) => FadeInLeft(
    duration: Duration(milliseconds: 500),
    child: BigButton(
          icon: item.icon,
          text: item.text,
          color1: item.color1,
          color2: item.color2,
          onPressed: (){ print('Hola Mundo');},
          ),
  )
       ).toList();

    return Scaffold(
      //backgroundColor: Colors.red,
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SizedBox(height: 80,),
                ...itemMap ///**( BigButton() )


              ],
            ),
          ),

          _Header(),


        ],
      )
   );
  }
}

class _Header extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: <Widget>[
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Medical Assistance',
          subtitle: 'You have requested',
          color1: Color(0xff536CF6),
          color2: Color(0xff66A9F2),
          ),

        Positioned(
          right: -10,
          top: 30,
          child: RawMaterialButton(
            onPressed: () {
              
            },
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
            child: FaIcon( FontAwesomeIcons.ellipsisVertical, color: Colors.white,)
            ) ),

      ],
    );
  }
}

class BigButtonTemp extends StatelessWidget {
  const BigButtonTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigButton(
      icon: FontAwesomeIcons.carBurst,
      text: 'Motor Accident!',
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
      onPressed: (){ print('Click');} ,
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