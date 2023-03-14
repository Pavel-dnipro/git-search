import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitsearch/cubits/favorites_cubit.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Repositories'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.favorites.isEmpty) {
            return Center(
              child: Text('You have no favorite repositories.'),
            );
          } else {
            return ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final repo = state.favorites[index];
                return ListTile(
                  title: Text(repo.name ?? ''),
                  subtitle: Text(repo.description ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {},
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
