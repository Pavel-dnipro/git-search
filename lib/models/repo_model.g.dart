// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepoAdapter extends TypeAdapter<Repo> {
  @override
  final int typeId = 1;

  @override
  Repo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repo(
      id: fields[0] as int?,
      name: fields[1] as String?,
      ownerName: fields[2] as String?,
      description: fields[3] as String?,
      stargazersCount: fields[4] as int?,
      forksCount: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Repo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ownerName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.stargazersCount)
      ..writeByte(5)
      ..write(obj.forksCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Repo _$$_RepoFromJson(Map<String, dynamic> json) => _$_Repo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      ownerName: json['ownerName'] as String?,
      description: json['description'] as String?,
      stargazersCount: json['stargazersCount'] as int?,
      forksCount: json['forksCount'] as int?,
    );

Map<String, dynamic> _$$_RepoToJson(_$_Repo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerName': instance.ownerName,
      'description': instance.description,
      'stargazersCount': instance.stargazersCount,
      'forksCount': instance.forksCount,
    };
