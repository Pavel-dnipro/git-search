// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_model.dart';

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