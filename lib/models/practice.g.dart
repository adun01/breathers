// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreathePracticeModelAdapter extends TypeAdapter<BreathePracticeModel> {
  @override
  final int typeId = 1;

  @override
  BreathePracticeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreathePracticeModel(
      name: fields[2] as String,
      steps: (fields[1] as List).cast<BreathePracticeStepModel>(),
      circles: fields[3] as int,
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BreathePracticeModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.steps)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.circles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreathePracticeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
