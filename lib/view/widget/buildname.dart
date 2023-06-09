import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class BuildName extends StatelessWidget {
  const BuildName({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: const TextStyle(fontSize: 24),
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: S.of(context).name_hintText,
        labelText: S.of(context).name_labelText,
      ),
      validator: (name) =>
          name != null && name.isEmpty ? S.of(context).name_validator : null,
    );
  }
}
