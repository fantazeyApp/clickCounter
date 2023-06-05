import 'package:flutter/material.dart';

class SettingModel {
  final String title;
  final String subtitle;
  final Function(bool) onChanged;
  final IconData secondary;
  final bool value;

  SettingModel(this.value,
      {required this.title,
      required this.subtitle,
      required this.onChanged,
      required this.secondary});
}
