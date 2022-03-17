// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sneakers_viewed_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SneakersViewedAdapter extends TypeAdapter<SneakersViewed> {
  @override
  final int typeId = 0;

  @override
  SneakersViewed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SneakersViewed(
      id: fields[0] as int,
      dateTimeViewed: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SneakersViewed obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateTimeViewed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SneakersViewedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
