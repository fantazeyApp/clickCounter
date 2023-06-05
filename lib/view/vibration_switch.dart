import 'package:click_counter/view/widget/switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wakelock/wakelock.dart';

import '../core/constants/ikey.dart';
import '../logic/switch_provider.dart';

class VibrationSwitch extends StatefulWidget {
  const VibrationSwitch({super.key});

  @override
  State<VibrationSwitch> createState() => _VibrationSwitchState();
}

class _VibrationSwitchState extends State<VibrationSwitch> {
  @override
  void didChangeDependencies() {
    Box box = Hive.box(IKey.settingKey);
    SwitchProvider.of(context)?.model.isVibrate =
        box.get(IKey.vibrate, defaultValue: false);
    super.didChangeDependencies();
  }

  void vibrationCalled(bool isVolumeState) {
    setState(() {
      SwitchProvider.of(context)!.model.isVibrate = isVolumeState;
      if (SwitchProvider.of(context)!.model.isVibrate == true) {
        Wakelock.enable();
      } else {
        Wakelock.disable();
      }
    });
  }

  void boxCall({required String key, required bool value}) {
    Box box = Hive.box(IKey.settingKey);
    box.put(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const TitleSwitch(title: 'Включить вибрацию'),
      subtitle: const SubTitle(subtitle: 'To enable it: Go to settings > sound&vibration > touch vibration'),
      value: SwitchProvider.of(context)!.model.isVibrate,
      onChanged: (value) async {
        setState(() {
          SwitchProvider.of(context)!.model.isVibrate = value;
        });
        boxCall(
          key: IKey.vibrate,
          value: SwitchProvider.of(context)!.model.isVibrate,
        );
      },
      secondary: const IconWidget(icon: Icons.vibration),
    );
  }
}
