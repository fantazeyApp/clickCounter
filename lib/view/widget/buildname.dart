import 'package:flutter/material.dart';

class BuildName extends StatelessWidget {
  const BuildName({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: const TextStyle(fontSize: 24),
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter Name',
        labelText: 'Counter name',
      ),
      validator: (name) => name != null && name.isEmpty ? 'Enter a name' : null,
    );
  }
}
