import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'repo_model.freezed.dart';
part 'repo_model.g.dart';

///  This class represents a single Github repository and includes properties
///  for its ID, name, owner name, description, number of stars,
///  and number of forks. We've also implemented the [freezed],
///  which will allow us to do a lot of cool things.

@HiveType(typeId: 1)
@freezed
class Repo with _$Repo {
  const factory Repo({
    @HiveField(0) required int? id,
    @HiveField(1) required String? name,
    @HiveField(2) required String? ownerName,
    @HiveField(3) required String? description,
    @HiveField(4) required int? stargazersCount,
    @HiveField(5) required int? forksCount,
  }) = _Repo;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
}
