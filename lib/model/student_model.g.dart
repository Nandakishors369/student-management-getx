// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudenDetailsAdapter extends TypeAdapter<StudenDetails> {
  @override
  final int typeId = 0;

  @override
  StudenDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudenDetails(
      name: fields[0] as String,
      age: fields[1] as String,
      classs: fields[2] as String,
      division: fields[3] as String,
      id: fields[4] as int?,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StudenDetails obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.classs)
      ..writeByte(3)
      ..write(obj.division)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudenDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
