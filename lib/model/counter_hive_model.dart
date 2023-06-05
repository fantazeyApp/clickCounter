import 'package:hive/hive.dart';
part 'counter_hive_model.g.dart';

@HiveType(typeId: 0)
class CounterHiveModel extends HiveObject {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late int count;
  @HiveField(2)
  late int totalCount;
  @HiveField(3)
  late String comment;
  @HiveField(4)
  late String dateCreation;
}
