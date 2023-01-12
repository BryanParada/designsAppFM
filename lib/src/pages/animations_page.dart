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

  late AnimationController controller; 
  late Animation<double> rotation;

  @override
  void initState() { 

    controller = new AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 4000)
      );

      rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);

      controller.addListener(() {

        print('Status ${controller.status}' );
        if (controller.status == AnimationStatus.completed){
          controller.reverse();
        } 

       });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {  
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    //play / reproduccion
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      //child: _Rectangle(),
      builder: (BuildContext context, Widget? child) {

        // print(rotation.value);
        
        return Transform.rotate(
          angle: rotation.value, 
          child: _Rectangle());
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