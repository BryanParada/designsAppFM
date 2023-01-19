import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class TwitterPage extends StatefulWidget {

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {

  bool activateAnimation = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: (){
          setState(() {
           activateAnimation = true;
            
          });
        },
      ),


      backgroundColor: Color(0xff1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activateAnimation,
          duration: Duration(seconds: 1),
          from: 30,
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 50)
          ),
     ),
   );
  }
}