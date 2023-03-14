import 'package:gitsearch/models/repo_model.dart';
import 'package:gitsearch/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  Future<List<Repo>> getFavorites() async {
    return <Repo>[];
  }

  Future<void> addFavorite(Repo item) async {}
  Future<void> removeFavorite(Repo item) async {}
}
