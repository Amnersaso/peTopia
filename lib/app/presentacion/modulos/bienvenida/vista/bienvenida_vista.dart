import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:petopia/app/presentacion/global/recursos/imagenes/recursos_imagenes.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petopia/app/presentacion/modulos/bienvenida/vista/consejos_vista.dart';

class BienvenidaVista extends StatefulWidget {
  const BienvenidaVista({super.key});

  @override
  State<BienvenidaVista> createState() => _BienvenidaVistaState();
}

class _BienvenidaVistaState extends State<BienvenidaVista> {
  String urlImagen = '';
  String descripcionImagen = '';
  String tituloImagen = '';

  Future<void> cargarInformacionImagen(BuildContext context) async {
    final response = await http
        .get(Uri.parse('https://sumaqsoftware.dev/resources/GetDatosInicio'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        urlImagen = data['linkImage'];
        descripcionImagen = data['text'];
        tituloImagen = data['title'];
      });
    } else {
      setState(() {
        urlImagen = 'assets/resource/imagenes/cachorro.jpg';
        descripcionImagen = 'Esto es una prueba';
        tituloImagen = 'Test Dog Cat';
      });
    }
    //cargar la imagen en segundo plano
    final image = NetworkImage(urlImagen);
    final completer = Completer<void>();
    final listener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) {
        completer.complete();
      },
      onError: (Object exception, StackTrace? stackTrace) {
        completer.completeError(exception, stackTrace);
      },
    );
    image.resolve(const ImageConfiguration()).addListener(listener);
    return completer.future;
  }

  @override
  void initState() {
    super.initState();
    cargarInformacionImagen(context).then(
      (value) {
        Future.delayed(const Duration(seconds: 1), () {
          //context.go('/consejo/$urlImagen/$descripcionImagen/$tituloImagen');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ConsejosVista(
                      urlImagen: urlImagen,
                      descripcionImagen: descripcionImagen,
                      tituloImagen: tituloImagen,
                    )),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 20, 111, 102),
            Color.fromARGB(255, 73, 244, 244)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Image.asset(
          RecursosImagenes.logo,
          height: 200,
          width: 140,
        ),
      ),
    );
  }
}
