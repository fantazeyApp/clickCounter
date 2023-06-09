import 'dart:async';
import 'package:click_counter/view/widget/switcher_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../core/constants/ikey.dart';
import '../generated/l10n.dart';
import '../logic/switch_provider.dart';

class VibrationSwitch extends StatefulWidget {
  const VibrationSwitch({super.key});

  @override
  State<VibrationSwitch> createState() => _VibrationSwitchState();
}

class _VibrationSwitchState extends State<VibrationSwitch> {
  late SnackBar snackBar2;
  Timer? _debounce;

  @override
  void didChangeDependencies() {
    Box box = Hive.box(IKey.settingKey);
    SwitchProvider.of(context)?.model.isVibrate =
        box.get(IKey.vibrate, defaultValue: false);
    super.didChangeDependencies();
  }

  Future<void> snackBarShow() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
    });
  }

  /* void vibrationCalled(bool isVibrateState) {
    setState(() {
      SwitchProvider.of(context)!.model.isVibrate = isVibrateState;
      if (SwitchProvider.of(context)!.model.isVibrate == true) {
        Wakelock.enable();
      } else {
        Wakelock.disable();
      }
    });
    snackBarShow();
  } */

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
    snackBar2 = SnackBar(
      content: SwitchProvider.of(context)!.model.isVibrate
          ? Text(S.of(context).snackbar_vibration_on)
          : Text(S.of(context).snackbar_vibration_off),
      action: SnackBarAction(label: 'Undo', onPressed: () {}),
    );
    return SwitchListTile(
      title: TitleSwitch(title: S.of(context).vibration_title),
      subtitle: SubTitle(subtitle: S.of(context).vibration_subtitle),
      value: SwitchProvider.of(context)!.model.isVibrate,
      onChanged: (value) async {
        if (mounted) {
          setState(() {
            SwitchProvider.of(context)!.model.isVibrate = value;
          });
        }

        boxCall(
          key: IKey.vibrate,
          value: SwitchProvider.of(context)!.model.isVibrate,
        );
        snackBarShow();
      },
      secondary: const IconWidget(icon: Icons.vibration),
    );
  }
}
