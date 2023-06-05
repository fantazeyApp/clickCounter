// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingHiveModelAdapter extends TypeAdapter<SettingHiveModel> {
  @override
  final int typeId = 1;

  @override
  SettingHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingHiveModel()
      ..volume = fields[1] as bool
      ..screenOn = fields[2] as bool
      ..vibrate = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, SettingHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.volume)
      ..writeByte(2)
      ..write(obj.screenOn)
      ..writeByte(3)
      ..write(obj.vibrate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
