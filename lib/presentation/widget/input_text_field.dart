import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String name;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool obscureText;

  set validator(FormFieldValidator<String>? validator) {
    this.validator = validator;
  }

  const InputTextField(
      {super.key,
      required this.name,
      this.onChanged,
      this.validator,
      this.controller,
      this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: name,
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        obscureText: obscureText,
        controller: controller,
        onChanged: onChanged,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "$name cannot be empty!";
          }
          return validator == null ? null : validator!(value);
        },
      ),
    );
  }
}
