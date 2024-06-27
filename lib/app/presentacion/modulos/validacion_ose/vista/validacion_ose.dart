import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petopia/app/presentacion/modulos/inicioSesion/vistas/registro_mascota.dart';
import 'package:petopia/app/presentacion/modulos/validacion_ose/controller/codigo_controller.dart';

class ValidacionOSE extends StatefulWidget {
  const ValidacionOSE({super.key});

  @override
  State<ValidacionOSE> createState() => _ValidacionOSEState();
}

class _ValidacionOSEState extends State<ValidacionOSE> {
  // Instancias de DigitControllerManager
  final List<DigitControllerManager> digitControllers =
      List.generate(6, (_) => DigitControllerManager());

  late int remainingSeconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = 5 * 60; // 5 minutos en segundos
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    // Asegúrate de limpiar los controladores
    for (var controller in digitControllers) {
      controller.dispose();
    }
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'CODIGO DE SEGURIDAD',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return digitControllers[index].buildTextField(context,
                      onChanged: (value) {
                    if (value.length == 1 && index < 5) {
                      FocusScope.of(context).nextFocus();
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus();
                    }
                  });
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistroMascota()));
                },
                child: const Text('Validar código'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'Reenviar código en: $minutes:${seconds.toString().padLeft(2, '0')}'),
              const SizedBox(
                height: 8,
              ),
              const Text('El código se envió al número 999 *** *69'),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Contactar a Soporte',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 150,
              ),
              const Text(
                'Cambiar de número',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
