// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BucketModelAdapter extends TypeAdapter<BucketModel> {
  @override
  final int typeId = 3;

  @override
  BucketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BucketModel(
      title: fields[0] as String?,
      content: fields[3] as String?,
      catogarynumber: fields[6] as int?,
      createDate: fields[7] as dynamic,
      finalDate: fields[2] as DateTime?,
      destination: fields[1] as String?,
      image1: fields[4] as Uint8List?,
      image2: fields[5] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, BucketModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.destination)
      ..writeByte(2)
      ..write(obj.finalDate)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.image1)
      ..writeByte(5)
      ..write(obj.image2)
      ..writeByte(6)
      ..write(obj.catogarynumber)
      ..writeByte(7)
      ..write(obj.createDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BucketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
