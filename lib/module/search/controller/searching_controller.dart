import 'dart:developer';

import 'package:assignment_test_xsis/module/detail/screen/detail_screen.dart';
import 'package:assignment_test_xsis/module/search/data/model/searching_movie_model.dart';
import 'package:assignment_test_xsis/module/search/data/repo/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingController extends GetxController with SearchRepo {
  TextEditingController searchController = TextEditingController();

  final searchLoading = false.obs;

  List<Results> listMovie = <Results>[];

  void searchMovie() async {
    if (searchController.text.isNotEmpty) {
      listMovie.clear();
      searchLoading.value = true;
      try {
        final response =
            await repoGetNowPlaying(keywoard: searchController.text);
        if ((response.results ?? []).isNotEmpty) {
          listMovie.addAll(response.results ?? []);
        }
        log('check isi nya : $listMovie');
        searchLoading.value = false;
      } catch (e) {
        print(e);
        searchLoading.value = true;
      }
    } else {
      Get.snackbar('keyword is empty', '');
    }
  }

  void showDetail({
    required int movieId,
  }) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      // isDismissible: true,
      backgroundColor: Colors.deepPurple,
      constraints: BoxConstraints(
        maxWidth: Get.width,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),

      builder: (context) {
        // return CommentScreen(news: news);
        return DetailScreen(
          movieID: movieId,
        );
      },
    );
  }
}
