import 'package:flutter/material.dart';

class SquareAnimatedPage extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _SquareAnimated()
          ),
    );
  }
}

class _SquareAnimated extends StatefulWidget { 
  @override
  State<_SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<_SquareAnimated> with SingleTickerProviderStateMixin{

  late AnimationController controller;
   
  //Aanimaciones 
  late Animation<double> moveRIGHT;
  late Animation<double> moveUP;
  late Animation<double> moveLEFT;
  late Animation<double> moveDOWN;

  @override
  void initState() {
    super.initState(); 

    

    controller = AnimationController(vsync:  this, duration: Duration(milliseconds: 4500));

    moveRIGHT = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0,0.25, curve: Curves.bounceOut))
    );

    moveUP = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25,0.5, curve: Curves.bounceOut))
    );

    moveLEFT = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5,0.75, curve: Curves.bounceOut))
    );

    moveDOWN = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75,1, curve: Curves.bounceOut))
    );

    controller.addListener(() {
      if( controller.status == AnimationStatus.completed){
        controller.reset();
      }
     });


  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moveRIGHT.value + moveLEFT.value, moveUP.value + moveDOWN.value),
          child: child,
          );
      },
    );
  }
}


class _Rectangle extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}