import 'dart:developer';

import 'package:assignment_test_xsis/module/search/data/model/searching_movie_model.dart';
import 'package:assignment_test_xsis/module/search/data/service/search_service.dart';

mixin SearchRepo {
  final _searchService = SearchService();

  Future<SearchMovieModel> repoGetNowPlaying({required String keywoard}) async {
    try {
      final data = await _searchService.getMoviesSearch(keyword: keywoard);

      return SearchMovieModel.fromJson(data);
    } catch (e) {
      log('Error Response Search Movie ::::: $e');
      rethrow;
    }
  }
}
