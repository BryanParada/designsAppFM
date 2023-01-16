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
      body: Center(
          child: Container(
            width: 300,
            height: 300,
            //color: Colors.red,
            child: RadialProgress( percentage: percentage,
                                   primaryColor: Colors.red, 
                                   secondaryColor: Colors.blue,
                                   strokePrimary: 5,
                                   strokeSecondary: 10,)
        // child: Text('${percentage}', style: TextStyle(fontSize: 50.0))),
          ),
        // child: CircularProgress(50, Color, ),
      ),
    );
  }
}