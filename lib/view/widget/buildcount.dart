import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildCount extends StatelessWidget {
  const BuildCount({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter number',
        labelText: 'Counter',
        labelStyle:TextStyle(fontSize: 24)
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (number) => number != null && int.tryParse(number) == null
          ? 'Enter a valid number'
          : null,
    );
  }
}
