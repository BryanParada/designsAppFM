import 'package:designs_backgrounds/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  

    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        //body: PinterestMenu( ),
        //child: PinterestGrid(),
    
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
       ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {

   final widthScreen = MediaQuery.of(context).size.width;
  final show = Provider.of<_MenuModel>(context).show;

    return Positioned(
      bottom: 30,
      child: Container(
        //color: Colors.red, 
        width: widthScreen,
        child: Align(
          // alignment: Alignment.center,
          child: PinterestMenu( 
            show: show,
            //backgroundColor: Colors.pink, //fondo menu
            activeColor: Colors.red, 
            inactiveColor: Colors.blueGrey,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon pie_chart');}),
              PinterestButton(icon: Icons.search, onPressed: (){print('Icon search');}),
              PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon notifications');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle');}),
            ]
          )
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

      if ( controller.offset > previousScroll  && controller.offset > 150){
        Provider.of<_MenuModel>(context, listen: false).show = false;
        print('Ocultar menu');
      } else{
        Provider.of<_MenuModel>(context, listen: false).show = true;
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

class _MenuModel with ChangeNotifier{

  bool _show = true;

  bool get show => this._show;

  set show( bool value ){
    this._show = value;
    notifyListeners();
  }

}