// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:click_counter/model/setting_model.dart';
import 'counter_hive_model.dart';

abstract class IRegisterHive {
  regAdapter();
}

class CounterRegister implements IRegisterHive {
  const CounterRegister();
  @override
  regAdapter() => Hive.registerAdapter(CounterHiveModelAdapter());
}

class SettingRegister implements IRegisterHive {
  const SettingRegister();
  @override
  regAdapter() => Hive.registerAdapter(SettingHiveModelAdapter());
}

abstract class IHiveFactory {
  const IHiveFactory();
  IRegisterHive createHive();
}

class CounterRegisterFactory implements IHiveFactory {
  const CounterRegisterFactory();
  @override
  IRegisterHive createHive() => const CounterRegister();
}

class SettingRegisterFactory implements IHiveFactory {
  const SettingRegisterFactory();
  @override
  IRegisterHive createHive() => const SettingRegister();
}

class AppRegisterHive {
  final IHiveFactory _factory;
  late final IRegisterHive _registerHive;
  AppRegisterHive(this._factory) {
    _registerHive = _factory.createHive();
  }

  void registerHive() async {
    _registerHive.regAdapter();
  }
}
