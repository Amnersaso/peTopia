import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petopia/app/presentacion/global/recursos/imagenes/recursos_imagenes.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/controladores/contrololador_texto.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/vistas/registrar_usuario.dart';
import 'package:petopia/app/presentacion/modulos/validacion_ose/vista/validacion_ose.dart';

class InicioSesionVista extends StatefulWidget {
  const InicioSesionVista({super.key});

  @override
  State<InicioSesionVista> createState() => _InicioSesionVistaState();
}

class _InicioSesionVistaState extends State<InicioSesionVista> {
  late TextControllerManager usernameController;
  late TextControllerManager passwordController;

  Future<String> validarNuevoLogin(String user, String pass) async {
    Map<String, String> parametros = {
      'nombreUsuario': user,
      'password': pass,
    };
    String datosJson =
        json.encode(parametros); // Convertir los datos a formato JSON
    try {
      // Realizar la solicitud POST
      final response = await http.post(
        Uri.parse('https://sumaqsoftware.dev/usuarios/login'),
        body: datosJson,
        headers: {
          'Content-Type':
              'application/json', // Configurar el tipo de medio como JSON
        },
      );
      final Map<String, dynamic> respuestaMap = jsonDecode(response.body);
      return respuestaMap['statusCode'].toString();
    } catch (error) {
      return 'Error: $error'; // Error al realizar la solicitud
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController = TextControllerManager(
      labelText: 'Código',
      hintText: 'ingrese código',
    );
    passwordController = TextControllerManager(
      labelText: 'Número de Teléfono',
      hintText: 'ingrese su número',
    );
  }

  @override
  void dispose() {
    // Asegúrate de limpiar los controladores
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                child: Image.asset(
                  RecursosImagenes.logo,
                  height: 200,
                  width: 140,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: usernameController.buildTextField()),
                        const SizedBox(width: 16),
                        Expanded(
                            flex: 2,
                            child: passwordController.buildTextField()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                colorTheme.primary),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                colorTheme.background)),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ValidacionOSE()));
                        },
                        child: const Text('Iniciar Sesión'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistroUsuario()));
                      },
                      child: const Text('¿Aún no tienes cuenta? Ingresa aquí'),
                    ),
                  ],
                ),
              ),
              const Text(
                'Registrado por X',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
