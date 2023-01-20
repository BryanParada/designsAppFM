import 'package:designs_backgrounds/src/theme/themechanger.dart';
import 'package:flutter/material.dart';

import 'package:designs_backgrounds/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      //backgroundColor: Colors.purple,
      body: Column(
        children: <Widget>[
           Expanded(child: MySlideshow()),
           //Expanded(child: MySlideshow()),
        ],
      )
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Slideshow(
      bulletPrimary: 20,
      bulletSecondary: 10,
      dotsUpper: false,
      colorPrimary: (appTheme.darkTheme) ? accentColor : Color(0xffFF5A7E),
      colorSecondary: Colors.grey,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
        // Text('Hola mundo'),
        // Container(
        //   width: 200,
        //   height: 200,
        //   color: Colors.blue,
        // )
      ]
    );
  }
}