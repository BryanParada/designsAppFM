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

class HeaderDiagonal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      )
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) { 

    final pencil = new Paint();

    //Propiedades lapiz
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //fill para rellenar - stroke para dibujar
    pencil.strokeWidth = 2;

    final path = new Path();

    //dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.5); //no es necesaria


    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }



}


class HeaderTriangle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      )
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) { 

    final pencil = new Paint();

    //Propiedades lapiz
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //fill para rellenar - stroke para dibujar
    pencil.strokeWidth = 15;

    final path = new Path();

    //dibujar con el path y el lapiz 
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0); 

    //para pintar lado opuesto
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height); 


    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

}


class HeaderPeak extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPeakPainter(),
      )
    );
  }
}

class _HeaderPeakPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) { 

    final pencil = new Paint();

    //Propiedades lapiz
    pencil.color = Color(0xff615AAB);
    pencil.style = PaintingStyle.fill; //fill para rellenar - stroke para dibujar
    pencil.strokeWidth = 15;

    final path = new Path();

    //dibujar con el path y el lapiz 
    path.lineTo(0, size.height * 0.25); 
    path.lineTo(size.width * 0.5, size.height * 0.30); 
    path.lineTo(size.width, size.height * 0.25); 
    path.lineTo(size.width,0); 

    canvas.drawPath(path, pencil);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

}