import 'package:flutter/material.dart';

class TextControllerManager {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  TextControllerManager({
    required this.labelText,
    required this.hintText,
  }) : controller = TextEditingController();

  void dispose() {
    controller.dispose();
  }

  Widget buildTextField() {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Color del borde
            width: 1.0, // Ancho del borde
          ),
        ),
        //focusedBorder: const OutlineInputBorder(
        //  borderSide: BorderSide(
        //    color: Colors.blue, // Color del borde cuando está enfocado
        //    width: 2.0, // Ancho del borde cuando está enfocado
        //  ),
        //),
        //enabledBorder: UnderlineInputBorder(
        //  borderRadius: BorderRadius.circular(5),
        //  borderSide: const BorderSide(color: Colors.red),
        //),
      ),
    );
  }
}
