import 'package:click_counter/view/widget/switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wakelock/wakelock.dart';

import '../core/constants/ikey.dart';
import '../logic/switch_provider.dart';

class KeepScreenOn extends StatefulWidget {
  const KeepScreenOn({super.key});

  @override
  State<KeepScreenOn> createState() => _KeepScreenOnState();
}

class _KeepScreenOnState extends State<KeepScreenOn> {
  @override
  void didChangeDependencies() {
    Box box = Hive.box(IKey.settingKey);
    SwitchProvider.of(context)?.model.isScreenOn =
        box.get(IKey.screenOn, defaultValue: false);
    super.didChangeDependencies();
  }

  void screenOnCalled(bool isVolumeState) {
    setState(() {
      SwitchProvider.of(context)!.model.isScreenOn = isVolumeState;
      if (SwitchProvider.of(context)!.model.isScreenOn == true) {
        Wakelock.enable();
      } else {
        Wakelock.disable();
      }
    });
    boxCall(
        key: IKey.screenOn,
        value: SwitchProvider.of(context)!.model.isScreenOn);
  }

  void boxCall({required String key, required bool value}) {
    Box box = Hive.box(IKey.settingKey);
    box.put(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const TitleSwitch(title: 'Не выключать экран'),
      subtitle: const SubTitle(subtitle: 'Держать экран в активном состоянии'),
      value: SwitchProvider.of(context)!.model.isScreenOn,
      onChanged: (value) => screenOnCalled(value),
      secondary: SwitchProvider.of(context)!.model.isScreenOn == true
          ? const IconWidget(icon: Icons.arrow_upward)
          : const IconWidget(icon: Icons.arrow_downward),
    );
  }
}
