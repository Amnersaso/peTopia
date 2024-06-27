import 'package:go_router/go_router.dart';
import 'package:petopia/app/presentacion/modulos/bienvenida/vista/bienvenida_vista.dart';
import 'package:petopia/app/presentacion/modulos/bienvenida/vista/consejos_vista.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/vistas/inicio_sesion_vista.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BienvenidaVista(),
    ),
    GoRoute(
      path: '/consejo/:param1/:param2/:param3',
      builder: (context, state) {
        final param1 = state.pathParameters['param1']!;
        final param2 = state.pathParameters['param2']!;
        final param3 = state.pathParameters['param3']!;
        return ConsejosVista(
            urlImagen: param1, descripcionImagen: param2, tituloImagen: param3);
      },
    ),
    GoRoute(
      path: '/inicioSesion',
      builder: (context, state) => const InicioSesionVista(),
    ),
  ],
);
