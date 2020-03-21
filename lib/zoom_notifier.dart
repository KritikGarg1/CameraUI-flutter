import 'package:flutter/material.dart';

class ZoomState with ChangeNotifier {
  ZoomState();

  double x=1.0;

  void zoom(double val){
    x=1+val/8;
    notifyListeners();
  }

  double get getZoom => x;
}