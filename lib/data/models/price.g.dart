// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAdapter extends TypeAdapter<Price> {
  @override
  final int typeId = 2;

  @override
  Price read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Price(
      currency: fields[0] as Currency,
      amount: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Price obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.currency)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrencyAdapter extends TypeAdapter<Currency> {
  @override
  final int typeId = 3;

  @override
  Currency read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Currency.GBP;
      case 1:
        return Currency.none;
      default:
        return Currency.GBP;
    }
  }

  @override
  void write(BinaryWriter writer, Currency obj) {
    switch (obj) {
      case Currency.GBP:
        writer.writeByte(0);
        break;
      case Currency.none:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
