// import 'package:flutter/material.dart';

// class FavoritesScreen extends StatelessWidget {
//   final FavoritesBloc favoritesBloc;

//   FavoritesScreen({required this.favoritesBloc});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Repositories'),
//       ),
//       body: BlocBuilder<FavoritesBloc, FavoritesState>(
//         bloc: favoritesBloc,
//         builder: (context, state) {
//           if (state is FavoritesLoadingState) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is FavoritesLoadedState) {
//             if (state.favorites.isEmpty) {
//               return Center(
//                 child: Text('You have no favorite repositories.'),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: state.favorites.length,
//                 itemBuilder: (context, index) {
//                   final repository = state.favorites[index];
//                   return ListTile(
//                     title: Text(repository.name),
//                     subtitle: Text(repository.description ?? ''),
//                     trailing: IconButton(
//                       icon: Icon(Icons.favorite, color: Colors.red),
//                       onPressed: () {
//                         favoritesBloc
//                             .add(RemoveFavoriteRepositoryEvent(repository));
//                       },
//                     ),
//                   );
//                 },
//               );
//             }
//           } else {
//             return Center(
//               child: Text('Error loading favorites.'),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
