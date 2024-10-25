import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/services/tmdb_client.dart';

class DetailService {
  Future<Map<String, dynamic>> getDetailMovie({required int movieID}) async {
    try {
      final res = await TMBDClient.get(
        path:
            '/movie/$movieID?${TMBDStrings.getApiKey}&language=en-US',
      );

      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}