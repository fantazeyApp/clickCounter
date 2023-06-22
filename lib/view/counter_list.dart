import 'package:click_counter/model/boxes.dart';
import 'package:click_counter/view/counter_dialog.dart';
import 'package:click_counter/model/counter_hive_model.dart';
import 'package:click_counter/view/widget/appbar_widget.dart';
import 'package:click_counter/view/widget/buildcontent.dart';
import 'package:click_counter/view/widget/drawer_widget.dart';
import 'package:click_counter/viewmodel/custom_admob.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../generated/l10n.dart';

class CounterList extends StatefulWidget {
  const CounterList({super.key});

  @override
  State<CounterList> createState() => _CounterListState();
}

class _CounterListState extends State<CounterList> {

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar:const CustomAdMob(),
      backgroundColor: const Color(0xFF00B0F0),
      resizeToAvoidBottomInset: false,
      appBar: const AppbarWidget(),
      drawer: const DrawerWidget(appbarTitle: 'Настройки'),
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
        tooltip: S.of(context).addbtn_tooltip,
        onPressed: () => showDialog(
            context: context,
            builder: (context) => SingleChildScrollView(
                child: CounterDialog(onClickedDone: addCounter))),
        child: const Icon(Icons.add),
      ),
    );
  }
}
