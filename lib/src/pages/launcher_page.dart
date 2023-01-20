import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Designs'),
      ),
      drawer: _MainMenu(),
      body: _OptionList()
   );
  }
}

class _OptionList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
       separatorBuilder: ( context, i ) => Divider(
        color: Colors.blue
       ),
       itemCount: 10,
      itemBuilder: (context, i) => ListTile(

        leading: FaIcon(FontAwesomeIcons.slideshare, color: Colors.blue),
        title: Text('hola'),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: (){

        },

      ) 
    );
  }
}

class _MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
    
            SafeArea(
              child: Container(
                //padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('BP', style: TextStyle(fontSize: 50),),
                )
              ),
            ),

            Expanded(
              child: _OptionList()
              ),


            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                 onChanged: (value ){}
                ),
            ),

            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                 onChanged: (value ){}
                ),
            ),
    
          ],
        )
      ),
    );
  }
}