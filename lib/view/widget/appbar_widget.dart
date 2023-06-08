import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Counters'),
      centerTitle: true,
      /* actions: <Widget>[
        PopupMenuButton<int>(
          elevation: 10,
          icon: const Icon(
            Icons.more_vert,
            // color: Color(0xFF08D9D6),
          ),
          position: PopupMenuPosition.under,
          color: const Color(0xffffffff),
          onSelected: (s) => {},
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 0,
              child: Text('Rate App'),
            ),
            PopupMenuItem(
              value: 1,
              child: Text('Share'),
            ),
            PopupMenuItem(
              value: 2,
              // onTap: (_){},
              child: Text('Police ...'),
            ),
          ],
        ),
      ], */
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.kAppbarHeight);
}
