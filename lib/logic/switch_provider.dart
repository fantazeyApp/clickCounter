import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SwitchModel extends ChangeNotifier with EquatableMixin {
  bool _isVolume = false;
  bool _isVibrate = false;
  bool _isWakeLock = false;
  String _date = '';

  bool get isVolume => _isVolume;
  bool get isScreenOn => _isWakeLock;
  bool get isVibrate => _isVibrate;
  String get date => _date;

  set isVolume(bool value) {
    _isVolume = value;
    notifyListeners();
  }

  set isScreenOn(bool value) {
    _isWakeLock = value;
    notifyListeners();
  }

  set isVibrate(bool value) {
    _isVibrate = value;
    notifyListeners();
  }

  set date(String value) {
    _date = value;
    notifyListeners();
  }

  @override
  List<Object?> get props => [isVolume, isScreenOn, isVibrate, date];
}

class SwitchProvider extends InheritedWidget {
  final SwitchModel model;
  const SwitchProvider({Key? key, required Widget child, required this.model})
      : super(key: key, child: child);

  static SwitchProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SwitchProvider>();
  }

  @override
  bool updateShouldNotify(SwitchProvider oldWidget) {
    return model != oldWidget.model;
  }
}
