import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:click_counter/core/constants/ikey.dart';
import 'package:click_counter/core/sizedbox.dart';
import 'package:click_counter/sound_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'logic/switch_provider.dart';
import 'model/counter_hive_model.dart';

class CounterView extends StatefulWidget {
  const CounterView({
    Key? key,
    this.counterModel,
    required this.onClickedDone,
  }) : super(key: key);

  final CounterHiveModel? counterModel;
  final Function(String name, int number, int totalClick, String comment)
      onClickedDone;

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  String? counterName;
  int counterNumber = 0;
  int counterTotal = 0;
  late SoundService sound;
  bool? isSound, vibrateOn;
  String? counterComment;

  @override
  void initState() {
    sound = SoundService();
    if (widget.counterModel != null) {
      final model = widget.counterModel;
      counterName = model!.title;
      counterNumber = model.count;
      counterTotal = model.totalCount;
      counterComment = model.comment;
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Box box = Hive.box(IKey.settingKey);
    var isVolume = SwitchProvider.of(context)?.model.isVolume;
    var isVibrate = SwitchProvider.of(context)?.model.isVibrate;
    isVolume = box.get(IKey.volume, defaultValue: false);
    isVibrate = box.get(IKey.vibrate, defaultValue: false);
    isSound = isVolume;
    vibrateOn = isVibrate;
    super.didChangeDependencies();
  }

  void vibrate() {
    if (vibrateOn == true) {
      HapticFeedback.heavyImpact();
    } else {
      null;
    }
  }

  void inrementButton() {
    vibrate();

    setState(() {
      if (isSound == true) {
        sound.playSound();
      } else {
        null;
      }
      counterNumber++;
      counterTotal++;
      widget.counterModel!.count = counterNumber;
      widget.counterModel!.totalCount = counterTotal;
      widget.counterModel!.save();
    });
  }

  void decrementButton() {
    vibrate();
    if (counterNumber > 0 && isSound == true) {
      sound.playSound();
    } else {
      null;
    }
    setState(() {
      if (counterNumber > 0) {
        counterNumber--;
        counterTotal++;
      }
      null;
      widget.counterModel!.count = counterNumber;
      widget.counterModel!.totalCount = counterTotal;
      widget.counterModel!.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF00B0F0),
      appBar: AppBar(
        title: Text(counterName!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 400,
                height: 250,
                child: FittedBox(
                  child: AnimatedFlipCounter(
                      duration: const Duration(milliseconds: 500),
                      value: counterNumber,
                      textStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                ),
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => decrementButton(),
                    child: const Icon(
                      Icons.remove,
                      size: 94,
                    ),
                  ),
                  10.pw,
                  ElevatedButton(
                    onPressed: () => inrementButton(),
                    child: const Icon(
                      Icons.add,
                      size: 94,
                    ),
                  ),
                ],
              ),
              20.ph,
              Center(
                child: Column(
                  children: [
                    Text(
                      'Total number of clicks: $counterTotal',
                      style: const TextStyle(fontSize: 20),
                    ),
                    8.ph,
                    Text(
                      '$counterComment',
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
