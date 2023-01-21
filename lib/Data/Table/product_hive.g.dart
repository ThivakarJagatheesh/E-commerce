// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductTableAdapter extends TypeAdapter<ProductTable> {
  @override
  final int typeId = 0;

  @override
  ProductTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductTable(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[2] as double?,
      description: fields[3] as String?,
      electronices: fields[4] as String?,
      jewellery: fields[5] as String?,
      mensClothing: fields[6] as String?,
      womensClothing: fields[7] as String?,
      image: fields[8] as String?,
      count: fields[10] as int?,
      rating: fields[9] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductTable obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.electronices)
      ..writeByte(5)
      ..write(obj.jewellery)
      ..writeByte(6)
      ..write(obj.mensClothing)
      ..writeByte(7)
      ..write(obj.womensClothing)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
