import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:designs_backgrounds/src/pages/slideshow_page.dart';

class LayoutModel with ChangeNotifier{

  Widget _currentPage = SlideshowPage();

  set currentPage(Widget page){
    this._currentPage = page;
    notifyListeners();
  }

  Widget get currentPage => this._currentPage;

}