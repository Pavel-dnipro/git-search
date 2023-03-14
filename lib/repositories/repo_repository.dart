import 'package:gitsearch/models/repo_model.dart';

///  This class represents a repository interface for searching repositories
///  and includes a method [searchRepos] that takes a search query
///  and returns a stream of paginated repositories.

abstract class ReposRepository {
  Future<List<Repo>> searchRepos(String? query, int page);
}
