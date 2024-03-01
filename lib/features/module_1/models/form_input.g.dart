// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_input.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormInputAdapter extends TypeAdapter<FormInput> {
  @override
  final int typeId = 1;

  @override
  FormInput read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FormInput(
      fields[0] as String,
      fields[1] as String,
      (fields[3] as List).cast<Option>(),
      currentScreenName: fields[4] as String?,
      username: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FormInput obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.questionTitle)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(3)
      ..write(obj.options)
      ..writeByte(4)
      ..write(obj.currentScreenName)
      ..writeByte(5)
      ..write(obj.username);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormInputAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
