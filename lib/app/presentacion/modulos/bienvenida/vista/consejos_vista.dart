import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petopia/app/configuracion/tema/proveedor_tema.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/vistas/inicio_sesion_vista.dart';
import 'package:provider/provider.dart';

class ConsejosVista extends StatefulWidget {
  final String urlImagen;
  final String descripcionImagen;
  final String tituloImagen;
  const ConsejosVista(
      {super.key,
      required this.urlImagen,
      required this.descripcionImagen,
      required this.tituloImagen});

  @override
  // ignore: no_logic_in_create_state
  State<ConsejosVista> createState() => _ConsejosVistaState(
      urlImagen: urlImagen,
      descripcionImagen: descripcionImagen,
      tituloImagen: tituloImagen);
}

class _ConsejosVistaState extends State<ConsejosVista> {
  final String urlImagen;
  final String descripcionImagen;
  final String tituloImagen;

  _ConsejosVistaState(
      {required this.urlImagen,
      required this.descripcionImagen,
      required this.tituloImagen});

  @override
  void initState() {
    super.initState();
    //cargarInformacionImagen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.network(
                urlImagen,
                height: 580,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 80, // Adjust the bottom position as needed
                right: 20, // Adjust the right position as needed
                child: Card(
                  elevation: 5, // Set card elevation for visual effect
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Set card border radius
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity, // Adjust card width as needed
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 7, left: 10, bottom: 6),
                          child: Text(
                            tituloImagen,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            descripcionImagen,
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    //context.go('/inicioSesion');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const InicioSesionVista()),
                                    );
                                  },
                                  child: const Text('Empezar')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
