import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gitsearch/models/repo_model.dart';
import 'package:gitsearch/repositories/favorites_repository.dart';

part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository favoritesRepository;
  FavoritesCubit(
    this.favoritesRepository, {
    FavoritesState favoritesState = const FavoritesState(),
  }) : super(favoritesState);

  Future<void> loadFavorites({String? query}) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final favorites = await favoritesRepository.getFavorites();

    emit(state.copyWith(
      isLoading: false,
      favorites: [...state.favorites, ...favorites],
    ));
  }

  Future<void> addFavorite(Repo item) async {
    emit(
      state.copyWith(isLoading: true, favorites: [...state.favorites, item]),
    );
    final favorites = await favoritesRepository.addFavorite(item);

    emit(state.copyWith(
      isLoading: false,
    ));
  }

  Future<void> removeFavorite(Repo item) async {
    emit(
      state.copyWith(isLoading: true),
    );
    List<Repo> currentFavorites = [...state.favorites];
    currentFavorites.remove(item);

    emit(state.copyWith(
      isLoading: false,
      favorites: currentFavorites,
    ));
  }
}

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    ///
    @Default([]) List<Repo> favorites,

    /// Notifies if async operations are being performed.
    @Default(false) bool isLoading,

    /// Error that might have occurred during the execution of a task.
    Exception? exception,
  }) = _FavoritesState;
}
