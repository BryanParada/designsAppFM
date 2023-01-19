import 'package:animate_do/animate_do.dart';
import 'package:designs_backgrounds/src/pages/navigation_page.dart';
import 'package:designs_backgrounds/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AnimatePage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          title: FadeIn(
            duration: Duration(milliseconds: 500),
            child: Text('Animate_do')
            ),
          actions: <Widget>[

            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter),
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TwitterPage())
                    );
              },
            ),

            SlideInLeft(
              from: 50,
              child: IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: (){
                  Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => AnimatePage1())
                    );
                },
              ),
            ),
          ],
          ),

            floatingActionButton: ElasticInRight(
              child: FloatingActionButton(
                child: FaIcon(FontAwesomeIcons.play),
                onPressed: (){
                 Navigator.push(
                    context, MaterialPageRoute(builder: (_) => NavigationPage())
                    );
                }
                ),
            ),

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  ElasticIn(
                    delay: Duration(milliseconds: 1100),
                    child: Icon(Icons.new_releases, color: Colors.blue, size: 40)
                    ),

                  FadeInDown(
                    delay: Duration(milliseconds: 200),
                    child: Text('Title', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200))
                    ),

                  FadeInDown(
                    delay: Duration(milliseconds: 800),
                    child: Text('I am a little text', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200))
                    ),

                  FadeInLeft(
                    delay: Duration(milliseconds: 1100),
                    child: Container(
                      width: 220,
                      height: 2,
                      color: Colors.blue
                    ),
                  )

                ],
              )
            )




          

   );
  }
}