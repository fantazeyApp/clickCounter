import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:click_counter/core/image_path.dart';
import 'package:click_counter/core/sizedbox.dart';
import 'package:click_counter/view/widget/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../../core/constants/ikey.dart';
import '../../logic/switch_provider.dart';
import '../../model/counter_hive_model.dart';
import '../../logic/sound_service.dart';
import 'buildbuttons.dart';

class BuildCounter extends StatefulWidget {
  const BuildCounter({super.key, required this.modelValue});
  final CounterHiveModel modelValue;

  @override
  State<BuildCounter> createState() => _BuildCounterState();
}

class _BuildCounterState extends State<BuildCounter> {
  late SoundService sound;
  bool? isSound, vibrateOn;
  // String? dateCreation;

  @override
  void didChangeDependencies() {
    SwitchProvider.of(context)?.model.addListener(() async {
      isSound = SwitchProvider.of(context)?.model.isVolume;
      vibrateOn = SwitchProvider.of(context)?.model.isVibrate;
    });
    if (mounted) {
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    sound = SoundService();
    super.initState();
  }

  void vibrate() {
    if (vibrateOn == true) {
      HapticFeedback.heavyImpact();
    } else {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Box box = Hive.box(IKey.settingKey);
    var isVolume = SwitchProvider.of(context)?.model.isVolume;
    var isVibrate = SwitchProvider.of(context)?.model.isVibrate;
    isVolume = box.get(IKey.volume, defaultValue: false);
    isVibrate = box.get(IKey.vibrate, defaultValue: false);
    isSound = isVolume;
    vibrateOn = isVibrate;

    return Column(
      children: [
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          child: ExpansionTile(
            collapsedBackgroundColor: const Color(0xFFCDF0FC),
            backgroundColor: const Color(0xFFCDF0FC),
            tilePadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(widget.modelValue.title,
                    maxLines: 2, style: const TextStyle(fontSize: 18)),
              ),
            ),
            subtitle: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          if (widget.modelValue.count > 0 && isSound == true) {
                            sound.playSound();
                          } else {
                            null;
                          }
                          vibrate();
                          if (mounted) {
                            setState(() {
                              if (widget.modelValue.count > 0) {
                                widget.modelValue.count--;
                                widget.modelValue.totalCount++;
                                widget.modelValue.save();
                              }
                            });
                          }
                        },
                        child: Image.asset('button40my5'.toPng),
                      ),
                      Center(
                        child: SizedBox(
                          width: 125,
                          height: 50,
                          child: FittedBox(
                            child: AnimatedFlipCounter(
                                duration: const Duration(milliseconds: 500),
                                value: widget.modelValue.count,
                                textStyle: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (isSound == true) {
                            sound.playSound();
                          } else {
                            null;
                          }
                          vibrate();
                          if (mounted) {
                            setState(() {
                              widget.modelValue.count++;
                              widget.modelValue.totalCount++;
                              widget.modelValue.save();
                            });
                          }
                        },
                        child: Image.asset('button40py4'.toPng),
                      ),
                    ]),
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 3),
                        color: const Color(0xFFCDF0FC),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Tabs(modelValue: widget.modelValue),
                        ],
                      ),
                    )),
              ),
              BuildButtons(model: widget.modelValue),
            ],
          ),
        ),
        8.ph,
      ],
    );
  }
}
