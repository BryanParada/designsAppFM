import 'package:designs_backgrounds/src/models/layout_model.dart';
import 'package:designs_backgrounds/src/pages/launcher_tablet_page.dart';
import 'package:designs_backgrounds/src/theme/themechanger.dart';
import 'package:flutter/material.dart';
import 'package:designs_backgrounds/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

//import 'package:designs_backgrounds/src/pages/animations_page.dart';
//import 'package:designs_backgrounds/src/pages/headers_page.dart';
//import 'package:designs_backgrounds/src/labs/circular_progress_page.dart';
//import 'package:designs_backgrounds/src/pages/graphs_circular_page.dart';
//import 'package:designs_backgrounds/src/pages/slideshow_page.dart';
//import 'package:designs_backgrounds/src/pages/pinterest_page.dart';
//import 'package:designs_backgrounds/src/pages/emergency_page.dart';
//import 'package:designs_backgrounds/src/pages/animate_do_page.dart';
//import 'package:designs_backgrounds/src/pages/sliver_list_page.dart';
// import 'package:designs_backgrounds/src/pages/animate_do_page.dart';
//import 'package:designs_backgrounds/src/pages/animate_do_page.dart';
// import 'package:designs_backgrounds/src/pages/twitter_page.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => new ThemeChanger(2),),
      ChangeNotifierProvider(create: (_) => new LayoutModel(),),
    ],
    child: const MyApp()
    ));

  //   void main() => runApp(
  // ChangeNotifierProvider(
  //   create: (_ ) => new ThemeChanger( 2 ), //guardar en preferencias de usuario
  //   child: const MyApp()
  //   ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Designs App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {

         // print('Orientation $orientation');

         final screenSize = MediaQuery.of(context).size;

         if ( screenSize.width > 500){ //tableta
          return LauncherTabletPage();
         }else{
          return LauncherPage();
         }

 
        },
      ),
    );
  }
}