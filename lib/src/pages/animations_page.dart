import 'dart:math' as Math;

import 'package:flutter/material.dart';

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquareAnimated(),
      ),
    );
  }
}

class SquareAnimated extends StatefulWidget {

  @override
  State<SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<SquareAnimated> with SingleTickerProviderStateMixin{

  late AnimationController myController; 
  late Animation<double> myRotation;

  late Animation<double> myOpacity;
  late Animation<double> myOpacityOut;

  late Animation<double> moveToTheRight;
  late Animation<double> enlarge;

  @override
  void initState() { 

    myController = new AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 4000)
      );

      myRotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
        CurvedAnimation(parent: myController, curve: Curves.easeOut)
      );

      myOpacity = Tween( begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: myController, curve: Interval(0, 0.25, curve: Curves.easeOut))
      );

      myOpacityOut = Tween( begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: myController, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
      );

      moveToTheRight = Tween(begin: 0.0, end: 200.0).animate(
        CurvedAnimation(parent: myController, curve: Curves.easeOut)
      );

      enlarge = Tween(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: myController, curve: Curves.easeOut)
      );

      myController.addListener(() {

        //print('Status ${myController.status}' );
        if (myController.status == AnimationStatus.completed){
          //myController.repeat();
          //controller.reverse();
          myController.reset();
        } 

       });

    myController.forward();
    super.initState();
  }

  @override
  void dispose() {  
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    //play / reproduccion
    myController.forward();

    return AnimatedBuilder(
      animation: myController,
      child: _Rectangle(),
      builder: (BuildContext context, Widget? childRectangle) {

        // print(rotation.value);
        // print('Status ${myController.status}' );
        // print('Opacity: ${myOpacity.value}' );
        // print('Rotation: ${myRotation.value}' );
        
        return Transform.translate(
          offset: Offset(moveToTheRight.value,0),
          child: Transform.rotate(
            angle: myRotation.value, 
            child: Opacity(
              opacity: myOpacity.value - myOpacityOut.value,
              child: Transform.scale(
                scale: enlarge.value,
                child: childRectangle
                )
              )
            ),
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