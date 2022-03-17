// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sneakers_cart_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SneakersCartAdapter extends TypeAdapter<SneakersCart> {
  @override
  final int typeId = 1;

  @override
  SneakersCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SneakersCart(
      id: fields[0] as int,
      count: fields[1] as int,
      price: fields[2] as Price,
    );
  }

  @override
  void write(BinaryWriter writer, SneakersCart obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SneakersCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
