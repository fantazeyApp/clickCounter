import 'package:flutter/material.dart';
import '../../model/counter_hive_model.dart';
import 'buildcounter.dart';

class BuildContent extends StatelessWidget {
  const BuildContent({super.key, required this.list});

  final List<CounterHiveModel> list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return const Center(
        child: Text('Create a counter, click the button at the bottom right',
            style: TextStyle(fontSize: 24)),
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
