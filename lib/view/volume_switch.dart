import 'package:click_counter/view/widget/switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../core/constants/ikey.dart';
import '../logic/switch_provider.dart';

class VolumeSwitch extends StatefulWidget {
  const VolumeSwitch({super.key});

  @override
  State<VolumeSwitch> createState() => _VolumeSwitchState();
}

class _VolumeSwitchState extends State<VolumeSwitch> {
  @override
  void didChangeDependencies() {
    Box box = Hive.box(IKey.settingKey);
    SwitchProvider.of(context)?.model.isVolume =
        box.get(IKey.volume, defaultValue: false);
    super.didChangeDependencies();
  }

  void volumeCalled(bool isVolumeState) {
    setState(() {
      SwitchProvider.of(context)!.model.isVolume = isVolumeState;
    });
    boxCall(
      key: IKey.volume,
      value: SwitchProvider.of(context)!.model.isVolume,
    );
  }

  void boxCall({required String key, required bool value}) {
    Box box = Hive.box(IKey.settingKey);
    box.put(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const TitleSwitch(title: 'Включить звуки'),
      subtitle: const SubTitle(
          subtitle: 'Воспроизводить звуки при изменении значений счетчика'),
      onChanged: (value) => volumeCalled(value),
      value: SwitchProvider.of(context)!.model.isVolume,
      secondary: SwitchProvider.of(context)!.model.isVolume == true
          ? const IconWidget(icon: Icons.volume_up)
          : const IconWidget(icon: Icons.volume_down),
    );
  }
}
