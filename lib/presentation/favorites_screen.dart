import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitsearch/cubits/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoritesCubit>(context).loadFavorites();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Repositories'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return Center(
              child: Text('You have no favorite repositories.'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final repo = state.favorites[index];
                      return ListTile(
                          title: Text(repo.name ?? ''),
                          subtitle: Text(repo.description ?? ''),
                          leading: IconButton(
                            onPressed: () =>
                                BlocProvider.of<FavoritesCubit>(context)
                                    .removeFavorite(repo),
                            icon: CircleAvatar(
                              child: Icon(Icons.star),
                            ),
                          ));
                    },
                  ),
                ),
                if (state.isLoading) CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }
}
