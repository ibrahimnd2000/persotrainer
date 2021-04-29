// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fullName: fields[0] as String,
      emailId: fields[1] as String,
      phoneNumber: fields[2] as String,
      birthday: fields[3] as String,
      height: fields[4] as String,
      weight: fields[5] as String,
      gender: fields[6] as String,
      fitnessLevel: fields[7] as String,
      interests: (fields[8] as Map)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.emailId)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.birthday)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.fitnessLevel)
      ..writeByte(8)
      ..write(obj.interests);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
