// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice-step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreathePracticeStepModelAdapter
    extends TypeAdapter<BreathePracticeStepModel> {
  @override
  final int typeId = 2;

  @override
  BreathePracticeStepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreathePracticeStepModel(
      fields[0] as int,
      fields[1] as BreatheType,
    );
  }

  @override
  void write(BinaryWriter writer, BreathePracticeStepModel obj) {
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
      other is BreathePracticeStepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
