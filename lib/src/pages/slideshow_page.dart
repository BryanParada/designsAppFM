import 'package:flutter/material.dart';

import 'package:designs_backgrounds/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Slideshow(
        dotsUpper: false,
        colorPrimary: Colors.purple,
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
      )
    );
  }
}