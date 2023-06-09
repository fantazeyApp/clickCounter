import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import '../../generated/l10n.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(S.of(context).appbar_title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.kAppbarHeight);
}
