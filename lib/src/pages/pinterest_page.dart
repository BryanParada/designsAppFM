import 'package:designs_backgrounds/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class PinterestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
      //body: PinterestMenu( ),
      //child: PinterestGrid(),

      body: Stack(
        children: <Widget>[
          PinterestGrid(),
          _PinterestMenuLocation(),
        ],
      ),
   );
  }
}

class _PinterestMenuLocation extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {

   final widthScreen = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 30,
      child: Container(
        //color: Colors.red, 
        width: widthScreen,
        child: Align(
          // alignment: Alignment.center,
          child: PinterestMenu()
        ),
      )
      );
  }
}


class PinterestGrid extends StatefulWidget { 

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i ) => i);
  ScrollController controller = new ScrollController();
  double previousScroll = 0.0;

  @override
  void initState() {

    controller.addListener(() { 
      //print('listener scroll ${controller.offset}');

      if ( controller.offset > previousScroll ){
        print('Ocultar menu');
      } else{
        print('Mostrar menu');
        
      }

      previousScroll = controller.offset;
      
    });

    super.initState(); 
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        controller: controller,
        crossAxisCount: 4,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => _PinterestItem( index ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2: 3),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  _PinterestItem(this.index);
 
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all( Radius.circular(30))
      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
    ));
  }
}