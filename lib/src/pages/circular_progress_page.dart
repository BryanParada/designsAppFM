import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {  
  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {

  double percentage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){

          percentage += 10;
          if(percentage >100){
            percentage = 0;
          }

          setState(() {
            
          });

        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MyRadialProgress( percentage )
          ),
        ),
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