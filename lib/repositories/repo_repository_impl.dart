import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gitsearch/models/repo_model.dart';
import 'package:gitsearch/repositories/repo_repository.dart';

class RepoRepositoryImpl implements ReposRepository {
  Future<List<Repo>> searchRepos(String? query, int page) async {
    final Completer<List<Repo>> completer = Completer();
    final int perPage = 15;
    final data = {
      'query': query,
      'page': page,
      'perPage': perPage,
    };
    final isolateData = {
      'query': query,
      'page': page + 1,
      'perPage': perPage,
    };

    final List<Future<List<Repo>>> futures = [
      searchRepositories(data),
      compute(searchRepositories, isolateData)
    ];

    // Wait for both requests to complete before returning results
    await Future.wait(futures).then((List<List<Repo>> results) {
      List<Repo> res = [];
      for (final List<Repo> repos in results) {
        res.addAll(repos);
      }
      completer.complete(res);
    });

    return completer.future.then((List<Repo> results) {
      // Limit the results to 30 items (15 from each thread)
      return results.take(30).toList();
    });
  }
}

final Dio _dio = Dio();
Future<List<Repo>> searchRepositories(Map<String, dynamic> data) async {
  final List<Repo> results = [];

  Map<String, String> _headers = <String, String>{
    'Accept': 'application/vnd.github.v3+json',
    'Authorization': 'token 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',
  };

  final Response response = await _dio.get(
    'https://api.github.com/search/repositories',
    options: Options(
      headers: _headers,
      validateStatus: (statusCode) {
        if (statusCode == null) {
          return false;
        }
        if (statusCode == 422) {
          // your http status code
          return true;
        } else {
          return statusCode >= 200 && statusCode < 300;
        }
      },
    ),
    queryParameters: {
      'q': data['query'],
      'page': data['page'],
      'per_page': data['perPage'],
    },
  );
  if (response.data['items'] != null) {
    final List<dynamic> items = response.data['items'];
    for (final item in items) {
      results.add(Repo.fromJson(item));
      print(Repo.fromJson(item));
    }
  }

  return results;
}
