import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField(
      {Key? key, required this.controller, this.hintText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54)),
        enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black54)),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter some text';
        }
        return null;
      },
      // validator: ,
    );
  }
}
