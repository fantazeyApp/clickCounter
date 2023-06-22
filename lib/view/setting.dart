import 'package:click_counter/core/sizedbox.dart';
import 'package:click_counter/view/keep_screen_on.dart';
import 'package:click_counter/view/vibration_switch.dart';
import 'package:click_counter/view/volume_switch.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../viewmodel/custom_admob.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const CustomAdMob(),
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
