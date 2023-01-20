
import 'package:designs_backgrounds/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      //body: _Title(),
      //body: _ListTasks(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList()
            ),

        ],
      ),
   );
  }
}

class _ButtonNewList extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {

    
    final appTheme = Provider.of<ThemeChanger>(context);  
    final size = MediaQuery.of(context).size;

        return ButtonTheme(
      child: ElevatedButton (
        style: ButtonStyle(
          backgroundColor: (appTheme.darkTheme)
                            ? MaterialStateProperty.all<Color>(appTheme.currentTheme.colorScheme.secondary)
                            : MaterialStateProperty.all<Color>(Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder> (
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            )
          )
        ),
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.7,
          child: Center(
            child: Text(
              'CREATE A NEW LIST',
              style: TextStyle(
                color: appTheme.currentTheme.scaffoldBackgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
          ),
        ),
        onPressed: (){}
      )
    );
  }
}

class _MainScroll extends StatelessWidget {
 
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
        _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];


    @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;  

    return CustomScrollView(
      slivers: <Widget>[
        
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('hola'), 
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Title(),
            )
          )
          ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100,)
            ])
          ),

      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child
});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) { 
    return SizedBox.expand(child: child);
  }

  @override 
  double get maxExtent => maxHeight;//(minHeight > maxHeight) ? minHeight : maxHeight;

  @override 
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) { 
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child     != oldDelegate.child;
  }



}

class _Title extends StatelessWidget {
    @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);  

    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('New', 
          style: TextStyle(
            color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
           fontSize: 50))
        ),

        Stack(
          children: <Widget>[

            SizedBox(width: 100,),
 
            Positioned(
              bottom: 8,
              child: Container(
                width: 130,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CD05), 
              ),
            ),
 

            Container(
              child: Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold)),
            ),



          ],
        ),
      ],
    );
  }
}

class _ListTasks extends StatelessWidget {

    final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget { 

  final String title;
  final Color color;

  const _ListItem( this.title,  this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);  


    return Container(
      child: Text(title, 
      style: TextStyle(
        color: Colors.white,
       fontWeight: FontWeight.bold,
        fontSize: 20)),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130, 
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : color ,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}