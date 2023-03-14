import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'repo_model.freezed.dart';
part 'repo_model.g.dart';

///  This class represents a single Github repository and includes properties
///  for its ID, name, owner name, description, number of stars,
///  and number of forks. We've also implemented the [freezed],
///  which will allow us to do a lot of cool things.

@freezed
class Repo with _$Repo {
  const factory Repo({
    required int? id,
    required String? name,
    required String? ownerName,
    required String? description,
    required int? stargazersCount,
    required int? forksCount,
  }) = _Repo;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
}
