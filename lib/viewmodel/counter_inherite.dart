import 'package:click_counter/model/counter_hive_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

class CounterValueListenable extends InheritedWidget {
  final ValueListenable<Box<CounterHiveModel>> listenable;
  CounterValueListenable({Key? key, required this.listenable, Widget? child})
      : super(key: key, child: child!);

  static ValueListenable of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CounterValueListenable>()!
        .listenable;
  }

  @override
  bool updateShouldNotify(CounterValueListenable oldWidget) =>
      listenable != oldWidget.listenable;
}
