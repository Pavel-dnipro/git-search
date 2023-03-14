import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gitsearch/models/repo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitsearch/cubits/favorites_cubit.dart';
import 'package:gitsearch/cubits/search_cubit.dart';
import 'package:gitsearch/presentation/search_screen.dart';
import 'package:gitsearch/repositories/favorites_repository_impl.dart';
import 'package:gitsearch/repositories/repo_repository_impl.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Should be moved to some initializer

  final directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);

  Hive.registerAdapter(RepoAdapter());
  await Hive.openBox<Repo>('favorites');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (_) => SearchCubit(
              RepoRepositoryImpl(),
            ),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => FavoritesCubit(
              FavoritesRepositoryImpl(),
            ),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: SearchScreen(),
        ));
  }
}
