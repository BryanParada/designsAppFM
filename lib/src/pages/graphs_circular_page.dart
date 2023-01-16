import 'package:designs_backgrounds/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraphCircularPage extends StatefulWidget {
  
  @override
  State<GraphCircularPage> createState() => _GraphCircularPageState();
}

class _GraphCircularPageState extends State<GraphCircularPage> {

  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
             setState(() {
                percentage += 10;
                if(percentage >100 )
                {
                  percentage = 0;
                } 

             });       
         
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(percentage: percentage, color: Colors.blue),
                CustomRadialProgress(percentage: percentage, color: Colors.red),
              ],
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomRadialProgress(percentage: percentage, color: Colors.purple),
                CustomRadialProgress(percentage: percentage, color: Colors.pink),
              ],
          ),

        ],
      ) 
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({ 
    required this.percentage,
    required this.color
  })  ;

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      //color: Colors.red,
      child: RadialProgress( percentage: percentage,
                             primaryColor: color, 
                             secondaryColor: Colors.blue,
                             strokePrimary: 5,
                             strokeSecondary: 10,)
        // child: Text('${percentage}', style: TextStyle(fontSize: 50.0))),
    );
  }
}