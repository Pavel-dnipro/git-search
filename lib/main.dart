import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitsearch/cubits/search_cubit.dart';
import 'package:gitsearch/presentation/search_screen.dart';
import 'package:gitsearch/repositories/repo_repository_impl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (_) => SearchCubit(
              RepoRepositoryImpl(),
            ),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: SearchScreen(),
        ));
  }
}