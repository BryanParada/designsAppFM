import 'package:designs_backgrounds/src/pages/slideshow_page.dart';
import 'package:designs_backgrounds/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:designs_backgrounds/src/routes/routes.dart';
import 'package:provider/provider.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Designs - Tablet'),
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
      ),
      drawer: _MainMenu(),
      body: Row(
        children: <Widget>[
          Container(
            width: 300,
            height: double.infinity,
            child: _OptionList(),
          ),

          //linea divisora vertical
          Container(
            width: 5,
            height: double.infinity,
            color: (appTheme.darkTheme ) ? Colors.grey: appTheme.currentTheme.colorScheme.secondary
          ),

          Expanded(
            child: SlideshowPage()
            ),

        ],
      ),
      //body: _OptionList()
   );
  }
}

class _OptionList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;


    return ListView.separated(
      physics: BouncingScrollPhysics(),
       separatorBuilder: ( context, i ) => Divider(
        color: appTheme.primaryColorLight
       ),
       itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(

        leading: FaIcon(pageRoutes[i].icon, color: appTheme.colorScheme.secondary),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary),
        onTap: (){
          Navigator.push(
                    context, MaterialPageRoute(builder: (_) => pageRoutes[i].page)
                    );
        },

      ) 
    );
  }
}

class _MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

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
                  backgroundColor: accentColor,
                  child: Text('BP', style: TextStyle(fontSize: 50),),
                )
              ),
            ),

            Expanded(
              child: _OptionList()
              ),


            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                 onChanged: (value ){
                  appTheme.darkTheme = value;
                 }
                ),
            ),

            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: accentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                   onChanged: (value ) => appTheme.customTheme = value
                  ),
              ),
            ),
    
          ],
        )
      ),
    );
  }
}