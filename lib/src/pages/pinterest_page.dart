import 'package:designs_backgrounds/src/theme/themechanger.dart';
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
             LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints){
                return Column(
                  children: <Widget>[
                    Spacer(),
                    _PinterestMenuLocation(constraints.maxWidth),
                    SizedBox(height: 30,)
                  ],
                );
              },
            )
          ],
        ),
       ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  final double constraints;
  _PinterestMenuLocation(this.constraints);
  @override
  Widget build(BuildContext context) {
    // double pageWidth = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    // if (pageWidth > 500 ) {
    //   pageWidth = pageWidth - 300;
    // }
    return Container(
        width: constraints,
        child: Row(
          children: <Widget>[
            Spacer(),
            PinterestMenu(
              show: show,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              activeColor: appTheme.colorScheme.secondary,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('piechart icon');
                    }),
                PinterestButton(
                    icon: Icons.search,
                    onPressed: () {
                      print('search icon');
                    }),
                PinterestButton(
                    icon: Icons.notifications,
                    onPressed: () {
                      print('notifications icon');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('supervised_user_circle icon');
                    }),
              ],
            ),
            Spacer(),
          ],
        ));
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

    int count;
    if (MediaQuery.of(context).size.width > 500){
      count = 3;
    }else{
      count = 2;
    }

    return StaggeredGridView.countBuilder(
        controller: controller,
        crossAxisCount: count,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => _PinterestItem( index ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(1, index.isEven ? 2: 3),
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