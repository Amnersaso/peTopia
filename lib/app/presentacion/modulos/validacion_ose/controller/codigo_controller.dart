import 'package:flutter/material.dart';

class DigitControllerManager {
  final TextEditingController controller;

  DigitControllerManager() : controller = TextEditingController();

  void dispose() {
    controller.dispose();
  }

  Widget buildTextField(BuildContext context,
      {required Function(String) onChanged}) {
    return SizedBox(
      width: 40, // Ancho fijo para cada dígito
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          counterText: "", // Eliminar el contador de caracteres
        ),
        maxLength: 1, // Solo un carácter por campo
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onChanged: onChanged,
      ),
    );
  }
}
