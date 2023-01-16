import 'dart:math';

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
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MyRadialProgress( widget.percentage )
      ),
    );
  }
}


class  _MyRadialProgress extends CustomPainter{

  final percentage;

  _MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) { 
 
    //Circulo completado
    final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final Offset center = new Offset( size.width * 0.5, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);

      canvas.drawCircle(center, radius, paint);

    //arco
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;

    //Parte que se debera ir llenando
    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), //espacio donde queremos ubicarlo
      -pi /2, //startAngle
      arcAngle, //sweepAngle
      false, //useCenter
      paintArc //paint
      );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)  => true;
 
  

}