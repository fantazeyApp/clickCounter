import 'package:click_counter/setting.dart';
import 'package:flutter/material.dart';

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
                  'Click Counter',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )),
          const ListTile(
            leading: Icon(Icons.thumb_up, color: Color(0xFF00B0F0)),
            title: Text('Rate app'),
            /* onTap: () {
              final gp = GooglePlay();
              gp.openURL();
            }, */
          ),
          const ListTile(
            leading: Icon(Icons.share, color: Color(0xFF00B0F0)),
            title: Text('Share'),
            /* onTap: () async {
              const googlePlayStore = AppConst.urlPlayGoogle;
              await Share.share(googlePlayStore);
            }, */
          ),
          const ListTile(
            leading: Icon(Icons.privacy_tip, color: Color(0xFF00B0F0)),
            title: Text('Privacy'),
            /* onTap: () {
              final pp = PrivacyPolicy();
              pp.openURL();
            }, */
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF00B0F0)),
            title: Text(appbarTitle),
            onTap: () async{
             await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingPage())).then((value) => 
                  Scaffold.of(context).openEndDrawer());
            },
          ),
        ],
      ),
    );
  }
}
