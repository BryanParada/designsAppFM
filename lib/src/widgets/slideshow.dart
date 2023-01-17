import 'package:designs_backgrounds/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool dotsUpper;
  final Color colorPrimary;
  final Color colorSecondary;

  const Slideshow({
    required this.slides,
    this.dotsUpper = false,
    this.colorPrimary = Colors.blue,
    this.colorSecondary = Colors.grey
    });

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new SliderModel(),
      child: SafeArea(
        child: Center( 
            child: Column(
              children: <Widget>[
               if (this.dotsUpper == true)  
               _Dots(this.slides.length, this.colorPrimary, this.colorSecondary),

                Expanded(
                  child: _Slides( this.slides )
                  ),

                if(!this.dotsUpper)  
                _Dots(this.slides.length, this.colorPrimary, this.colorSecondary),
              ],
            )
          ),
      ),
      );
  }
}


class _Dots extends StatelessWidget { 

  final int totalSlides;
  final Color colorPrimary;
  final Color colorSecondary;
  
  const _Dots(
    this.totalSlides,
   this.colorPrimary,
    this.colorSecondary);
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (i) => _Dot(index: i, colorPrimary: colorPrimary, colorSecondary: colorSecondary)),
        // children: <Widget>[
        //   _Dot(index: 0),
        //   _Dot(index: 1),
        //   _Dot(index: 2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  final Color colorPrimary;
  final Color colorSecondary;

  const _Dot({
    required this.index,
     required this.colorPrimary,
      required this.colorSecondary,
  }) ;

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
         ? colorPrimary: colorSecondary,
        shape: BoxShape.circle

      ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;

  const _Slides(this.slides);
  
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = new PageController();


  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {

      //print('Actual page: ${ pageViewController.page}');
      //actualizar el provider - Slider model
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!; //* DEBE SER FALSO AL ESTAR EN EL INITSTATE!!!!!

     });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      
      child: PageView(
        controller: pageViewController,
        // children: <Widget>[
        //   _Slide(svg: 'assets/svgs/slide-1.svg'),
        //   _Slide(svg: 'assets/svgs/slide-2.svg'),
        //   _Slide(svg: 'assets/svgs/slide-3.svg'), 
        // ],
        children: widget.slides.map( (slide) => _Slide(slide: slide,) ).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

final Widget slide;

  const _Slide({ required this.slide }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide
    );
  }
}