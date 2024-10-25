import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_list/movie_by_genres_response.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_list/movie_genre.dart';
import 'package:assignment_test_xsis/services/tmdb_client.dart';

class HomeService {
  Future<Map<String, dynamic>> getNowPlaying() async {
    try {
      final res = await TMBDClient.get(
        path:
            '/movie/now_playing?${TMBDStrings.getApiKey}&language=en-US&page=1',
        // url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=b8903b791ab75fc18a3ec0b368f333b2&language=en-US&page=1',
        // customHeader: customHeader,
      );

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getPopular() async {
    try {
      final res = await TMBDClient.get(
        path: '/movie/popular?${TMBDStrings.getApiKey}&language=en-US&page=1',
        // url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=b8903b791ab75fc18a3ec0b368f333b2&language=en-US&page=1',
        // customHeader: customHeader,
      );

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Genre>> getGenres() async {
    try {
      final res = await TMBDClient.get(
        path: '/genre/movie/list?${TMBDStrings.getApiKey}&language=en',
        // url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=b8903b791ab75fc18a3ec0b368f333b2&language=en-US&page=1',
        // customHeader: customHeader,
      );

      return (res.data['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getMovieByGenres({
    required int genreId,
  }) async {
    try {
      final res = await TMBDClient.get(
        path:
            '/discover/movie?${TMBDStrings.getApiKey}&with_genres=$genreId',
        // url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=b8903b791ab75fc18a3ec0b368f333b2&language=en-US&page=1',
        // customHeader: customHeader,
      );

      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  // /discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=28

  // /genre/movie/list?language=en

  // /movie/popular?language=en-US&page=1
}
