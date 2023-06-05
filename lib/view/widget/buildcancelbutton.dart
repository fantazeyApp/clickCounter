import 'package:flutter/material.dart';

class BuildCancelButton extends StatelessWidget {
  const BuildCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cansel'));
  }
}
