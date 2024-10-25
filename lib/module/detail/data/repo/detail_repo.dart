import 'dart:developer';

import 'package:assignment_test_xsis/module/detail/data/model/detail_movie_model.dart';
import 'package:assignment_test_xsis/module/detail/data/service/detail_service.dart';

mixin DetailRepo{
  final _detailService = DetailService();

  Future<MovieDetailModel> repoGetNowPlaying({required int movieID}) async {
    try {
      final data = await _detailService.getDetailMovie(movieID: movieID);

      return MovieDetailModel.fromJson(data);
    } catch (e) {
      log('Error Response Movie Detail ::::: $e');
      rethrow;
    }
  }
}