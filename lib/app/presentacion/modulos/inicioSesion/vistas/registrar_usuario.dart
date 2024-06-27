import 'package:flutter/material.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/controladores/contrololador_texto.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/vistas/inicio_sesion_vista.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  late TextControllerManager nombreController;
  late TextControllerManager apellidoController;
  late TextControllerManager edadController;
  late TextControllerManager codigoController;
  late TextControllerManager telefonoController;

  @override
  void initState() {
    super.initState();
    nombreController = TextControllerManager(
      labelText: 'Nombres',
      hintText: 'ingrese su nombre completo',
    );
    apellidoController = TextControllerManager(
      labelText: 'Apellidos',
      hintText: 'ingrese su apellido completo',
    );
    edadController = TextControllerManager(
      labelText: 'Fecha Nacimiento',
      hintText: 'ingrese su fecha de nacimiento',
    );
    codigoController = TextControllerManager(
      labelText: 'Código',
      hintText: 'ingrese código de país',
    );
    telefonoController = TextControllerManager(
      labelText: 'Número de Teléfono',
      hintText: 'ingrese su número teléfono',
    );
  }

  @override
  void dispose() {
    // Asegúrate de limpiar los controladores
    nombreController.dispose();
    apellidoController.dispose();
    edadController.dispose();
    codigoController.dispose();
    telefonoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Cuenta'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navegar de regreso a la pantalla anterior
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            nombreController.buildTextField(),
            const SizedBox(height: 15),
            apellidoController.buildTextField(),
            const SizedBox(height: 15),
            edadController.buildTextField(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: codigoController.buildTextField()),
                const SizedBox(width: 16),
                Expanded(flex: 2, child: telefonoController.buildTextField()),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica cuando se presiona el botón
                },
                child: const Text('Guardar'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InicioSesionVista()));
              },
              child: const Text('Tienes cuenta, ingresa aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
