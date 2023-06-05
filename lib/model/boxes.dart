import 'package:click_counter/core/constants/ikey.dart';
import 'package:click_counter/model/setting_model.dart';
import 'package:hive/hive.dart';

import 'counter_hive_model.dart';

class Boxes {
  static Box<CounterHiveModel> getCounterModel() =>
      Hive.box<CounterHiveModel>(IKey.counterKey);
    
  static Box<SettingHiveModel> getSettingModel() =>
      Hive.box<SettingHiveModel>(IKey.settingKey);
}
