import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/services/tmdb_client.dart';

class SearchService {
  Future<Map<String, dynamic>> getMoviesSearch({required String keyword}) async {
    try {
      final res = await TMBDClient.get(
        path:
            '/search/movie?query=$keyword&${TMBDStrings.getApiKey}&page=1&include_adult=false&language=en-US&year=2022',//'/movie/$movieID?${TMBDStrings.getApiKey}&language=en-US',
      );
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}