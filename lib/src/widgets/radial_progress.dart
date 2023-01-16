import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

final percentage;
final Color primaryColor;
final Color secondaryColor;
final double strokePrimary;
final double strokeSecondary;

  const RadialProgress({
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blue,
    this.strokeSecondary = 4,
    this.strokePrimary = 2
    });


   @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late double previousPercentage;

  @override
  void initState() {
    
    previousPercentage = widget.percentage;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final differenceAnimate = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget? child) {
        return Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _MyRadialProgress( (widget.percentage - differenceAnimate) + (differenceAnimate + controller.value),
                widget.primaryColor,
                widget.secondaryColor,
                widget.strokeSecondary,
                widget.strokePrimary),
              ),
            );
      },
    );

    
  }
}


class  _MyRadialProgress extends CustomPainter{

  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double strokePrimary;
  final double strokeSecondary;

  _MyRadialProgress(
    this.percentage,
     this.primaryColor,
     this.secondaryColor,
     this.strokeSecondary,
     this.strokePrimary
    
    );

  @override
  void paint(Canvas canvas, Size size) { 

    final Rect rect = new Rect.fromCircle(
      center: Offset(0,0),
      radius: 180
      );

    final Gradient myGradient = new LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red
      ]);
 
    //Circulo completado
    final paint = new Paint()
      ..strokeWidth = strokePrimary
      ..color       = secondaryColor//Colors.grey
      ..style       = PaintingStyle.stroke;

    final Offset center = new Offset( size.width * 0.5, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);

      canvas.drawCircle(center, radius, paint);

    //arco
    final paintArc = new Paint()
      ..strokeWidth = strokeSecondary
      //..color       = primaryColor//Colors.pink //<----comentar shader y descomentar color para volver a colores originales
      ..shader      = myGradient.createShader(rect)
      ..strokeCap   = StrokeCap.round
      ..maskFilter  = MaskFilter.blur(BlurStyle.solid, 5)
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