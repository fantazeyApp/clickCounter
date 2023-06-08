import 'package:hive/hive.dart';
part 'setting_model.g.dart';

@HiveType(typeId: 1)
class SettingHiveModel extends HiveObject {
  @HiveField(1)
  late bool volume;
  @HiveField(2)
  late bool screenOn;
  @HiveField(3)
  late bool vibrate;
}
