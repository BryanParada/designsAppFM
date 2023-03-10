import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{

  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  ThemeChanger(int theme){
      _currentTheme = ThemeData.light() ;

      switch(theme){
        case 1: //light
          _darkTheme = false;
          _customTheme = false;
          _currentTheme = ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink)
          );
        break;

        case 2: //dark
          _darkTheme = true;
          _customTheme = false;
          _currentTheme = ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
          );
        break;

        case 3: //dark
          _darkTheme = false;
          _customTheme = true; 
        break;

        default: 
          _darkTheme = false;
          _customTheme = false;
          _currentTheme = ThemeData.light();

      }
  }
 

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value){
    _customTheme = false;
    _darkTheme = value;

    if (value){
      _currentTheme = ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
            
          );
    }else{
      _currentTheme = ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink)
          );
    }

    notifyListeners();
  }

  set customTheme(bool value){
    _customTheme = value;
    _darkTheme = false;

    if (value){
      _currentTheme = ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xff48A0EB)),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle( color: Colors.white)
        )
      );
    }else{
      _currentTheme = ThemeData.light();
    }


    notifyListeners();
  }

}