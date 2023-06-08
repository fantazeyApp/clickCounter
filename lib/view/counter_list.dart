import 'package:click_counter/model/boxes.dart';
import 'package:click_counter/view/counter_dialog.dart';
import 'package:click_counter/model/counter_hive_model.dart';
import 'package:click_counter/view/widget/appbar_widget.dart';
import 'package:click_counter/view/widget/buildcontent.dart';
import 'package:click_counter/view/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CounterList extends StatefulWidget {
  const CounterList({super.key});

  @override
  State<CounterList> createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {
 
  /* late SoundService sound;
  bool? isSound, vibrateOn; */
  //String? dateCreation;

  /* @override
  void initState() {
    sound = SoundService();
    super.initState();
  } */

/*   @override
  void didChangeDependencies() {
    SwitchProvider.of(context)?.model.addListener(() async {
      isSound = SwitchProvider.of(context)?.model.isVolume;
      vibrateOn = SwitchProvider.of(context)?.model.isVibrate;
    });
    setState(() {});
    super.didChangeDependencies();
  } */

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  /* void vibrate() {
    if (vibrateOn == true) {
      HapticFeedback.heavyImpact();
    } else {
      null;
    }
  } */

  @override
  Widget build(BuildContext context) {
    /* Box box = Hive.box(IKey.settingKey);
    var isVolume = SwitchProvider.of(context)?.model.isVolume;
    var isVibrate = SwitchProvider.of(context)?.model.isVibrate;
    isVolume = box.get(IKey.volume, defaultValue: false);
    isVibrate = box.get(IKey.vibrate, defaultValue: false);
    isSound = isVolume;
    vibrateOn = isVibrate; */

    Future addCounter(
        String name, int number, int total, String comment, String date) async {
      final counterModel = CounterHiveModel()
        ..title = name
        ..count = number
        ..totalCount = total
        ..comment = comment
        ..dateCreation = date;
      final box = Boxes.getCounterModel();
      await box.add(counterModel);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF00B0F0),
      resizeToAvoidBottomInset: false,
      appBar: const AppbarWidget(),
      drawer:const DrawerWidget(appbarTitle: 'Настройки'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ValueListenableBuilder<Box<CounterHiveModel>>(
              valueListenable: Boxes.getCounterModel().listenable(),
              builder: (context, Box<CounterHiveModel> box, _) {
                final counterModels = box.values.toList();
                return BuildContent(list: counterModels);
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFCDF0FC),
        foregroundColor: Colors.black,
        tooltip: 'Create a new counter',
        onPressed: () => showDialog(
            context: context,
            builder: (context) => SingleChildScrollView(
                child: CounterDialog(onClickedDone: addCounter))),
        child: const Icon(Icons.add),
      ),
    );
  }
}
