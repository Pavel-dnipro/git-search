import 'package:gitsearch/models/repo_model.dart';

///  This class represents a repository interface for Favorites

abstract class FavoritesRepository {
  Future<List<Repo>> getFavorites();

  Future<void> addFavorite(Repo item);

  Future<void> removeFavorite(Repo item);
}
