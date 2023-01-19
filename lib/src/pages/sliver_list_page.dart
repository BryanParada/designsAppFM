import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _Title(),
      body: _ListTasks(),
   );
  }
}

class _Title extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('New', style: TextStyle(color: Color(0xff532128), fontSize: 50))
        ),

        Stack(
          children: <Widget>[

            SizedBox(width: 100,),
 
            Positioned(
              bottom: 8,
              child: Container(
                width: 130,
                height: 8,
                color: Color(0xffF7CD05),
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
    return Container(
      child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130, 
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}