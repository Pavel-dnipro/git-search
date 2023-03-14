import 'package:hive_flutter/hive_flutter.dart';
import 'package:gitsearch/models/repo_model.dart';
import 'package:gitsearch/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final _favoritesBox = Hive.box<Repo>('favorites');

  Future<List<Repo>> getFavorites() async {
    List<Repo> favorites = _favoritesBox.values.toList();
    return favorites;
  }

  Future<void> addFavorite(Repo item) async {
    _favoritesBox.put(item.id, item);
  }

  Future<void> removeFavorite(Repo item) async {
    _favoritesBox.delete(item.id);
  }
}
