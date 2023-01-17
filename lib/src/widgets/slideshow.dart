
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
      create: ( _ ) => new _SlideshowModel(),
      child: SafeArea(
        child: Center( 
            child: Builder(
              builder: (BuildContext context) {

                //Debe ir aqui
                Provider.of<_SlideshowModel>(context).colorPrimary = this.colorPrimary;
                Provider.of<_SlideshowModel>(context).colorSecondary = this.colorSecondary;

                return _CreateStructureSlideShow(dotsUpper: dotsUpper, slides: slides);
              },
              )
          ),
      ),
      );
  }
}

class _CreateStructureSlideShow extends StatelessWidget {
  const _CreateStructureSlideShow({
    Key? key,
    required this.dotsUpper,
    required this.slides,
  }) : super(key: key);

  final bool dotsUpper;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       if (this.dotsUpper == true)  
       _Dots(this.slides.length),

        Expanded(
          child: _Slides( this.slides )
          ),

        if(!this.dotsUpper)  
        _Dots(this.slides.length),
      ],
    );
  }
}


class _Dots extends StatelessWidget { 

  final int totalSlides; 
  
  const _Dots(
    this.totalSlides );
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (i) => _Dot(index: i)),
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

  const _Dot({
    required this.index
  }) ;

  @override
  Widget build(BuildContext context) {

    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    final ssModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5)
         ? ssModel.colorPrimary : ssModel.colorSecondary,
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page!; //* DEBE SER FALSO AL ESTAR EN EL INITSTATE!!!!!

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


class _SlideshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimary = Colors.blue;
  Color _colorSecondary = Colors.grey;

  double get currentPage => this._currentPage;

  set currentPage( double page ){
    this._currentPage = page;
    //print(page);
    
    notifyListeners();
  }

  Color get colorPrimary => this._colorPrimary;
  set colorPrimary( Color color){
    this._colorPrimary = color;
    //notifyListeners();
  }

  Color get colorSecondary => this._colorSecondary;
  set colorSecondary( Color color){
    this._colorSecondary = color;
    //notifyListeners();
  }


}