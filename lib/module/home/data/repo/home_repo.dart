import 'dart:developer';

import 'package:assignment_test_xsis/module/home/data/model/movie_list/movie_by_genres_response.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_list/movie_genre.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_popular/movie_popular_response.dart';
import 'package:assignment_test_xsis/module/home/data/model/now_playing/now_playing_response.dart';
import 'package:assignment_test_xsis/module/home/data/service/home_service.dart';

mixin HomeRepo {
  final _homeService = HomeService();

  Future<NowPlayingResponse> repoGetNowPlaying() async {
    try {
      final data = await _homeService.getNowPlaying();

      return NowPlayingResponse.fromJson(data);
    } catch (e) {
      log('Error Response Now Playing ::::: $e');
      rethrow;
    }
  }

  Future<MoviePopularResponse> repoGetPopular() async {
    try {
      final data = await _homeService.getPopular();

      return MoviePopularResponse.fromJson(data);
    } catch (e) {
      log('Error Response Movie Popular ::::: $e');
      rethrow;
    }
  }

  Future<List<Genre>> repoGetGenres() async {
    try {
      final data = await _homeService.getGenres();

      return data;
    } catch (e) {
      log('Error Response List Genres ::::: $e');
      rethrow;
    }
  }

  Future<MovieByGenresResponse> repoGetMovieByGenres({
    required int genreId,
  }) async {
    try {
      final data = await _homeService.getMovieByGenres(
        genreId: genreId,
      );

      return MovieByGenresResponse.fromJson(data);
    } catch (e) {
      log('Error Response Movie By Genre ::::: $e');
      rethrow;
    }
  }
}
