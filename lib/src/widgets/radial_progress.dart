import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

final percentage;

  const RadialProgress({this.percentage});


   @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${widget.percentage}')
    );
  }
}