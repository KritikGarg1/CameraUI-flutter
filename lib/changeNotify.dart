import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  AppState();

  double opa=0.0;

  void toggle(){
    if(opa==0.0)opa=1.0;
    else opa=0.0;
notifyListeners();
  }

  double get getOpacity => opa;
}