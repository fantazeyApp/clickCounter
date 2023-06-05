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

  /*  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SettingHiveModel && other.volume == volume;
  }

  @override
  int get hashCode => volume.hashCode;

  @override
  String toString() {
    return 'Bool volume: $volume';
  } */
}
