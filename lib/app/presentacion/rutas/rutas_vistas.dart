import 'package:flutter/material.dart';
import 'package:petopia/app/presentacion/modulos/bienvenida/vista/bienvenida_vista.dart';
//import 'package:petopia/app/presentacion/modulos/bienvenida/vista/consejos_vista.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/vistas/inicio_sesion_vista.dart';

class AppRoutes {
  static const String rBienvenida = '/';
  //static const String rConsejo = '/rConsejo';
  static const String rInicioSesion = '/rInicioSesion';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rBienvenida:
        return MaterialPageRoute(builder: (_) => const BienvenidaVista());
      //case rConsejo:
      //  return MaterialPageRoute(builder: (_) => ConsejosVista());
      case rInicioSesion:
        return MaterialPageRoute(builder: (_) => const InicioSesionVista());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
