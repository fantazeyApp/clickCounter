import 'package:click_counter/core/constants/constants.dart';
import 'package:click_counter/view/setting.dart';
import 'package:flutter/material.dart';

import '../../core/launch_url.dart';
import '../../generated/l10n.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.appbarTitle,
  });

  final String appbarTitle;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF00B0F0),
              ),
              child: Center(
                child: Text(
                  S.of(context).drawer_header,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF00B0F0)),
            title: Text(S.of(context).drawer_title_setings),
            onTap: () async {
              await Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => const SettingPage()))
                  .then((value) => Scaffold.of(context).openEndDrawer());
            },
          ),
          ListTile(
            leading: const Icon(Icons.thumb_up, color: Color(0xFF00B0F0)),
            title: Text(S.of(context).drawer_title_rate),
            onTap: () {
              const googlePlay = LaunchUrl();
              googlePlay.openURL(AppConstants.rateApp);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Color(0xFF00B0F0)),
            title: Text(S.of(context).drawer_title_privacy),
            onTap: () {
              const prPolicy = LaunchUrl();
              prPolicy.openURL(AppConstants.privacy);
            },
          ),
        ],
      ),
    );
  }
}
