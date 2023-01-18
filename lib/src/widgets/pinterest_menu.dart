import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton{
   final Function onPressed;
   final IconData icon;

   PinterestButton({ 
    required this.onPressed, 
    required this.icon});
}

class PinterestMenu extends StatelessWidget {

  final bool show;

  PinterestMenu({
    required this.show
  });
  
  final List <PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon pie_chart');}),
    PinterestButton(icon: Icons.search, onPressed: (){print('Icon search');}),
    PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon notifications');}),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle');}),
    
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: ( show ) ? 1 : 0,
        child: _PinterestMenuBackground(
          child: _MenuItems( items )
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;

  _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container( 
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            // offset: Offset(5,5),
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems( 
   this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])),
    );
  }
}


class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {

  final itemSelected = Provider.of<_MenuModel>(context).itemSelected;

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      }, //TODO: fix
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: ( itemSelected == index ? 30: 25),
          color: ( itemSelected == index ? Colors.red : Colors.blueGrey)
          )
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{

  int _itemSelected = 0;

  int get itemSelected => this._itemSelected;

  set itemSelected(int index){
    this._itemSelected = index;
    notifyListeners();
  }

}