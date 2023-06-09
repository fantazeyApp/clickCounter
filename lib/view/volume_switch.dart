import 'dart:async';
import 'package:click_counter/view/widget/switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../core/constants/ikey.dart';
import '../generated/l10n.dart';
import '../logic/switch_provider.dart';

class VolumeSwitch extends StatefulWidget {
  const VolumeSwitch({super.key});

  @override
  State<VolumeSwitch> createState() => _VolumeSwitchState();
}

class _VolumeSwitchState extends State<VolumeSwitch> {
  late SnackBar snackBar;
  Timer? _debounce;

  @override
  void didChangeDependencies() {
    Box box = Hive.box(IKey.settingKey);
    SwitchProvider.of(context)?.model.isVolume =
        box.get(IKey.volume, defaultValue: false);
    super.didChangeDependencies();
  }

  Future<void> snackBarShow() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void volumeCalled(bool isVolumeState) {
    if (mounted) {
      setState(() {
        SwitchProvider.of(context)!.model.isVolume = isVolumeState;
      });
    }

    boxCall(
      key: IKey.volume,
      value: SwitchProvider.of(context)!.model.isVolume,
    );
    snackBarShow();
  }

  void boxCall({required String key, required bool value}) {
    Box box = Hive.box(IKey.settingKey);
    box.put(key, value);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    snackBar = SnackBar(
      content: SwitchProvider.of(context)!.model.isVolume
          ? Text(S.of(context).snackbar_volume_on)
          : Text(S.of(context).snackbar_volume_off),
      action: SnackBarAction(label: S.of(context).undo, onPressed: () {}),
    );

    return SwitchListTile(
      title: TitleSwitch(title: S.of(context).volume_title),
      subtitle: SubTitle(subtitle: S.of(context).volume_subtitle),
      onChanged: (value) => volumeCalled(value),
      value: SwitchProvider.of(context)!.model.isVolume,
      secondary: SwitchProvider.of(context)!.model.isVolume == true
          ? const IconWidget(icon: Icons.volume_up)
          : const IconWidget(icon: Icons.volume_down),
    );
  }
}
