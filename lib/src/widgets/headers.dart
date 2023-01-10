import 'package:flutter/material.dart';

class HeaderSquare extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRadius extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //color: Color(0xff615AAB),
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(70), bottomRight: Radius.circular(70))
      ),
    );
  }
}