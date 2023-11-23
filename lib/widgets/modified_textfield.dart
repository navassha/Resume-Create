import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_creater/extensions/responsive.dart';

class ModifiedTextField extends StatelessWidget {
  const ModifiedTextField(
      {super.key,
      required this.controller,
      required this.text,
      this.keyboardType,
      this.inputFormatters});

  final TextEditingController controller;
  final String text;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: inputFormatters,
      style: TextStyle(fontSize: context.width(20)),
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: text,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            context.width(18),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            context.width(18),
          ),
        ),
      ),
    );
  }
}
