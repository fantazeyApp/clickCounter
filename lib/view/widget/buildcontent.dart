import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../../model/counter_hive_model.dart';
import 'buildcounter.dart';

class BuildContent extends StatelessWidget {
  const BuildContent({super.key, required this.list});

  final List<CounterHiveModel> list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Center(
        child: DecoratedBox(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(S.of(context).create_counter_text,
                style: const TextStyle(fontSize: 24)),
          ),
        ),
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final counterValue = list[index];
                return BuildCounter(modelValue: counterValue);
              },
            ),
          ),
        ],
      );
    }
  }
}
