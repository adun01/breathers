// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practic-step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreathePracticStepModelAdapter
    extends TypeAdapter<BreathePracticStepModel> {
  @override
  final int typeId = 2;

  @override
  BreathePracticStepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreathePracticStepModel(
      fields[0] as int,
      fields[1] as BreatheType,
    );
  }

  @override
  void write(BinaryWriter writer, BreathePracticStepModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreathePracticStepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
