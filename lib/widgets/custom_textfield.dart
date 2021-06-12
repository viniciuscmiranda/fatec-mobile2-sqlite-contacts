import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.controller, this.hint, this.label, this.icon});

  final TextEditingController controller;
  final String hint;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          labelText: label,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal.shade200),
            borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
          ),
        ),
      ),
    );
  }
}
