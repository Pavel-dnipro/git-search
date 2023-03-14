import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:gitsearch/models/repo_model.dart';
import 'package:gitsearch/repositories/repo_repository.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.repository, {
    SearchState searchState = const SearchState(),
  }) : super(searchState);

  final ReposRepository repository;

  Future<void> getSearchResult({String? query}) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    final List<Repo> repos = await repository.searchRepos(
      query ?? state.searchQuery,
      state.currentPage,
    );

    emit(state.copyWith(
      isLoading: false,
      searchQuery: query,
      repos: [...state.repos, ...repos],
      currentPage: state.currentPage + 2,
    ));
  }
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    ///
    @Default([]) List<Repo> repos,

    ///
    String? searchQuery,

    ///
    @Default(1) int currentPage,

    /// Notifies if async operations are being performed.
    @Default(false) bool isLoading,

    /// Error that might have occurred during the execution of a task.
    Exception? exception,
  }) = _SearchState;
}
