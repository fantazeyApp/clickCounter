import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class BuildCancelButton extends StatelessWidget {
  const BuildCancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(S.of(context).cansel_navigator));
  }
}
