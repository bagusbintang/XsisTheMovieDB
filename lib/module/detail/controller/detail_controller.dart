import 'package:assignment_test_xsis/module/detail/data/model/detail_movie_model.dart';
import 'package:assignment_test_xsis/module/detail/data/repo/detail_repo.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailController extends GetxController with DetailRepo {
  DetailController({required this.movieID});
  
  final int movieID;
  final YoutubePlayerController youtubePlayerController = YoutubePlayerController(
    initialVideoId: '73_1biulkYk',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  final detailLoading = false.obs;
  late MovieDetailModel detailMovie;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchDetailMovie();
  }

  Future<void> fetchDetailMovie() async {
    detailLoading.value = true;
    try {
      final response = await repoGetNowPlaying(movieID: movieID);
      detailMovie = response;
      detailLoading.value = false;
    } catch (e) {
      print(e);
      detailLoading.value = true;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    youtubePlayerController.dispose();
  }
}
