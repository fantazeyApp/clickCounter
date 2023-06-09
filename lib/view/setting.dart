import 'package:click_counter/core/sizedbox.dart';
import 'package:click_counter/view/keep_screen_on.dart';
import 'package:click_counter/view/vibration_switch.dart';
import 'package:click_counter/view/volume_switch.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settingpage_appbar_title),
      ),
      body: Column(
        children: [
          const VolumeSwitch(),
          10.ph,
          const KeepScreenOnOff(),
          10.ph,
          const VibrationSwitch(),
        ],
      ),
    );
  }
}
