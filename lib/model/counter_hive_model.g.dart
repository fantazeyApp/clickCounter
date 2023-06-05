// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CounterHiveModelAdapter extends TypeAdapter<CounterHiveModel> {
  @override
  final int typeId = 0;

  @override
  CounterHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CounterHiveModel()
      ..title = fields[0] as String
      ..count = fields[1] as int
      ..totalCount = fields[2] as int
      ..comment = fields[3] as String
      ..dateCreation = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, CounterHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.totalCount)
      ..writeByte(3)
      ..write(obj.comment)
      ..writeByte(4)
      ..write(obj.dateCreation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CounterHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
