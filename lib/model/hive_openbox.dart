import 'package:click_counter/model/counter_hive_model.dart';
import 'package:click_counter/model/setting_model.dart';
import 'package:hive/hive.dart';

import '../core/constants/ikey.dart';

abstract class IOpenBox {
  const IOpenBox();
  Future<Box> makeOpen();
}

class CounterOpenBox implements IOpenBox {
  @override
  Future<Box<CounterHiveModel>> makeOpen() async =>
    Hive.openBox<CounterHiveModel>(IKey.counterKey);
  
}

class SettingOpenBox implements IOpenBox {
  @override
  Future<Box<SettingHiveModel>> makeOpen() async =>
    Hive.openBox<SettingHiveModel>(IKey.settingKey);
  
}

abstract class IOpenBoxFactory {
  const IOpenBoxFactory();
  IOpenBox createOpenBox();
}

class CounterOpenBoxFactory implements IOpenBoxFactory {
  const CounterOpenBoxFactory();
  @override
  IOpenBox createOpenBox() => CounterOpenBox();
}

class SettingOpenBoxFactory implements IOpenBoxFactory {
  const SettingOpenBoxFactory();
  @override
  IOpenBox createOpenBox() => SettingOpenBox();
}

class AppOpenBoxHive {
  final IOpenBoxFactory _factory;
  late final IOpenBox _openBox;
  AppOpenBoxHive(this._factory) {
    _openBox = _factory.createOpenBox();
  }

  Future<Box> makeOpenBox() async =>
   _openBox.makeOpen();
  
}
