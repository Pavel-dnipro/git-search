// import 'package:flutter_bloc/flutter_bloc.dart';

// class FavoritesCubit extends Cubit<FavoritesEvent, FavoritesState> {
//   final FavoritesRepository favoritesRepository;

//   FavoritesBloc({required this.favoritesRepository})
//       : super(FavoritesLoadingState());

//   @override
//   Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
//     if (event is LoadFavoritesEvent) {
//       try {
//         final favorites = await favoritesRepository.getFavorites();

//         yield FavoritesLoadedState(favorites: favorites);
//       } catch (e) {
//         yield FavoritesErrorState(errorMessage: e.toString());
//       }
//     } else if (event is AddFavoriteRepositoryEvent) {
//       final repository = event.repository;
//       try {
//         await favoritesRepository.addFavorite(repository);

//         yield FavoritesLoadedState(
//             favorites: state.favorites + [repository],
//             addedRepository: repository);
//       } catch (e) {
//         yield FavoritesErrorState(errorMessage: e.toString());
//       }
//     } else if (event is RemoveFavoriteRepositoryEvent) {
//       final repository = event.repository;
//       try {
//         await favoritesRepository.removeFavorite(repository);

//         yield FavoritesLoadedState(
//             favorites:
//                 state.favorites.where((r) => r.id != repository.id).toList(),
//             removedRepository: repository);
//       } catch (e) {
//         yield FavoritesErrorState(errorMessage: e.toString());
//       }
//     }
//   }
// }
