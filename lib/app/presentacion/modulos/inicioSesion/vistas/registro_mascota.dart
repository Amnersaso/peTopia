import 'package:flutter/material.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/controladores/contrololador_texto.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/vistas/inicio_sesion_vista.dart';
import 'package:petopia/app/presentacion/modulos/menuPrincipal/vista/menu_principal.dart';

class RegistroMascota extends StatefulWidget {
  const RegistroMascota({super.key});

  @override
  State<RegistroMascota> createState() => _RegistroMascotaState();
}

class _RegistroMascotaState extends State<RegistroMascota> {
  late TextControllerManager nombreMascotaController;
  late TextControllerManager razaController;
  late TextControllerManager fechaNacimientoController;
  late TextControllerManager paisController;
  late TextControllerManager departamentoController;
  late TextControllerManager telefonoController;
  late TextControllerManager ubigeoController;
  late TextControllerManager direccionController;

  String? selectedTipoMascota;

  @override
  void initState() {
    super.initState();
    nombreMascotaController = TextControllerManager(
      labelText: 'Nombre de la Mascota',
      hintText: 'ingrese nombre de la mascota',
    );
    razaController = TextControllerManager(
      labelText: 'Raza',
      hintText: 'ingrese su raza',
    );
    fechaNacimientoController = TextControllerManager(
      labelText: 'Fecha de Nacimiento',
      hintText: 'ingrese fecha de nacimiento',
    );
    paisController = TextControllerManager(
      labelText: 'País',
      hintText: 'ingrese el país',
    );
    departamentoController = TextControllerManager(
      labelText: 'Departamento',
      hintText: 'ingrese el departamento',
    );
    telefonoController = TextControllerManager(
      labelText: 'Teléfono',
      hintText: 'ingrese número de teléfono',
    );
    ubigeoController = TextControllerManager(
      labelText: 'Ubigeo',
      hintText: 'ingrese su ubigeo',
    );
    direccionController = TextControllerManager(
      labelText: 'Dirección',
      hintText: 'ingrese su dirección',
    );
  }

  @override
  void dispose() {
    // Asegúrate de limpiar los controladores
    nombreMascotaController.dispose();
    razaController.dispose();
    fechaNacimientoController.dispose();
    paisController.dispose();
    departamentoController.dispose();
    telefonoController.dispose();
    ubigeoController.dispose();
    direccionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Mascota'),
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
            nombreMascotaController.buildTextField(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: DropdownButton<String>(
                    hint: const Text('Seleccione'),
                    value: selectedTipoMascota,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTipoMascota = newValue;
                      });
                    },
                    items: <String>[
                      'Opción 1',
                      'Opción 2',
                      'Opción 3',
                      'Opción 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: DropdownButton<String>(
                    hint: const Text('Seleccione'),
                    value: selectedTipoMascota,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedTipoMascota = newValue;
                      });
                    },
                    items: <String>[
                      'Opción 1',
                      'Opción 2',
                      'Opción 3',
                      'Opción 4'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            fechaNacimientoController.buildTextField(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: paisController.buildTextField()),
                const SizedBox(width: 16),
                Expanded(
                    flex: 1, child: departamentoController.buildTextField()),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: telefonoController.buildTextField()),
                const SizedBox(width: 16),
                Expanded(flex: 1, child: ubigeoController.buildTextField()),
              ],
            ),
            const SizedBox(height: 15),
            direccionController.buildTextField(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuPrincipal()));
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
