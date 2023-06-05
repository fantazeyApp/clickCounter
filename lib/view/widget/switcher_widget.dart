import 'package:flutter/material.dart';

class TitleSwitch extends StatelessWidget {
  const TitleSwitch({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(subtitle);
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
