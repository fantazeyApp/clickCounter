import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class BuildComment extends StatelessWidget {
  const BuildComment({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 3,
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: S.of(context).comment_hinttext,
          labelText: S.of(context).comment_labeltext,
          labelStyle: const TextStyle(fontSize: 24)),
      validator: (comment) => comment != null && comment.isEmpty
          ? S.of(context).comment_validator
          : null,
    );
  }
}
