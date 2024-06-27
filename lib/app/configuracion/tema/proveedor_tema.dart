import 'package:flutter/material.dart';
import 'package:petopia/app/configuracion/tema/tema_claro.dart';
import 'package:petopia/app/configuracion/tema/tema_oscuro.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = temaClaro;
  ThemeData get themeData => _themeData;
  bool get isDartMode => _themeData == temaOscuro;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == temaClaro) {
      themeData = temaOscuro;
    } else {
      themeData = temaClaro;
    }
  }
}
