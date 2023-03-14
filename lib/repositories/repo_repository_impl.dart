import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:gitsearch/models/repo_model.dart';
import 'package:gitsearch/repositories/repo_repository.dart';

import 'package:http/http.dart' as http;

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

Future<List<Repo>> searchRepositories(Map<String, dynamic> data) async {
  final List<Repo> results = [];

  Map<String, String> _headers = <String, String>{
    'Accept': 'application/vnd.github+json',
    'Authorization': 'Bearer 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',
    'X-GitHub-Api-Version': '2022-11-28',
  };

  final queryParameters = {
    'q': data['query'],
    'page': data['page'].toString(),
    'per_page': data['perPage'].toString(),
  };

  final response = await http.get(
    Uri.https(
      'api.github.com',
      '/search/repositories',
      queryParameters,
    ),
    headers: _headers,
  );

  Map<String, dynamic> payload = jsonDecode(response.body);

  if (payload['items'] != null) {
    final List<dynamic> items = payload['items'];
    for (final item in items) {
      results.add(Repo.fromJson(item));
      print(Repo.fromJson(item));
    }
  }

  return results;
}
