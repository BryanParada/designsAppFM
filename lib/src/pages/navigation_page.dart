import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavigationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _NotificationModel(),
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
    
        floatingActionButton: _FloatingButton(),
    
        bottomNavigationBar: BottomNavigation(),
    
       ),
    );
  }
}


class _FloatingButton extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.plus) ,
      onPressed: (){

        int number = Provider.of<_NotificationModel>(context, listen: false).numberNoti;
        number ++;
        Provider.of<_NotificationModel>(context, listen: false).numberNoti = number;

      });
  }
}

class BottomNavigation extends StatelessWidget {
    @override
  Widget build(BuildContext context) {

    final int notifNumber = Provider.of<_NotificationModel>(context).numberNoti;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [

        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone)
        ),

        
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),

              Positioned(
                top: 0.0,
                right: 0.0,
                // child: Icon(Icons.brightness_1, size: 8, color: Colors.redAccent)
                child: Container(
                  child: Text('$notifNumber', style: TextStyle(color: Colors.white, fontSize: 10)),
                  alignment: Alignment.center,
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle
                  ),
                )
                )
            ],
          )
        ),


        BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog)
        ),



      ]
    );
  }
}


class _NotificationModel extends ChangeNotifier{

  int _numberNoti = 0;

  int get numberNoti => this._numberNoti;

  set numberNoti(int value){
    this._numberNoti = value;
    notifyListeners();
  }

}