import 'package:flutter/material.dart';

class BuildComment extends StatelessWidget {
  const BuildComment({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 3,
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Write a comment for this counter',
        labelText: 'Comments',
        labelStyle:TextStyle(fontSize: 24)
      ),
      validator: (comment) => comment != null && comment.isEmpty
          ? 'Write a comment for this counter'
          : null,
    );
  }
}
