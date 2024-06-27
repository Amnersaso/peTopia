import 'package:flutter/material.dart';
import 'package:petopia/app/configuracion/tema/proveedor_tema.dart';
import 'package:petopia/app/presentacion/modulos/bienvenida/vista/bienvenida_vista.dart';
import 'package:petopia/app/presentacion/rutas/rutas.dart';
import 'package:provider/provider.dart';

//void main() {
//  runApp(const MyApp());
//}
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //ChangeNotifierProvider(create: (context) => LoginPage()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const BienvenidaVista(),
      //routerDelegate: router.routerDelegate,
      //routeInformationParser: router.routeInformationParser,
      //routeInformationProvider: router.routeInformationProvider,
    );
  }
}
