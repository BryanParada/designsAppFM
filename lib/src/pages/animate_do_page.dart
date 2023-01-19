import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AnimatePage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: Text('Animate_do'),
          actions: <Widget>[

            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter),
              onPressed: (){},
            ),

            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: (){},
            ),
          ],
          ),

            floatingActionButton: FloatingActionButton(
              child: FaIcon(FontAwesomeIcons.play),
              onPressed: (){}
              ),

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Icon(Icons.new_releases, color: Colors.blue, size: 40),

                  Text('Title', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200)),

                  Text('I am a little text', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200)),

                  Container(
                    width: 220,
                    height: 2,
                    color: Colors.blue
                  )

                ],
              )
            )




          

   );
  }
}