import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../generated/l10n.dart';

class BuildCount extends StatelessWidget {
  const BuildCount({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration:  InputDecoration(
        border:const OutlineInputBorder(),
        hintText: S.of(context).count_hintText,
        labelText: S.of(context).count_labelText,
        labelStyle:const TextStyle(fontSize: 24)
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (number) => number != null && int.tryParse(number) == null
          ? S.of(context).count_validator
          : null,
    );
  }
}
