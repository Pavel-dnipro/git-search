import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gitsearch/cubits/search_cubit.dart';
import 'package:gitsearch/presentation/favorites_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(),
                  ),
                );
              }),
          title: TextField(
            autofocus: true,
            focusNode: focusNode,
            keyboardType: TextInputType.text,
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  BlocProvider.of<SearchCubit>(context).getSearchResult(
                    query: _searchController.text,
                  );
                }),
          ],
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (_, state) {
            if (state.isLoading)
              return Center(child: CircularProgressIndicator());
            return ListView.separated(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !state.isLoading) {
                    BlocProvider.of<SearchCubit>(context).getSearchResult();
                  }
                }),
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(state.repos?[index].name ?? ''),
                  subtitle: Text(state.repos?[index].description ?? ''),
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: state.repos?.length ?? 0,
            );
          },
        ));
  }
}
