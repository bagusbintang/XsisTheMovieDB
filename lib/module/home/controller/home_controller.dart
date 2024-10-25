import 'dart:developer';
import 'package:assignment_test_xsis/module/detail/screen/detail_screen.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_list/movie_by_genre.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_popular/movie_popular.dart';
import 'package:assignment_test_xsis/module/home/data/model/now_playing/now_playing.dart';
import 'package:assignment_test_xsis/module/home/data/repo/home_repo.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/movie_list/movie_genre.dart';

class HomeController extends GetxController with HomeRepo {
  CarouselController nowPlayingCarouselController = CarouselController();
  final nowPlayingIndex = 0.obs;

  //loading
  final nowPlayingLoading = false.obs;
  final popularLoading = false.obs;
  final genresLoading = false.obs;
  final movieByGenresLoading = false.obs;

  List<NowPlaying> nowPlayingList = <NowPlaying>[];
  List<MoviePopular> popularList = <MoviePopular>[];
  List<Genre> genres = <Genre>[];
  // List<MovieByGenre> movieByGenreList = <MovieByGenre>[];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    await fetchNowPlaying();
    await fetchPopularMovie();
    await fetchGenres();
  }

  Future<void> fetchNowPlaying() async {
    nowPlayingList.clear();
    nowPlayingLoading.value = true;
    try {
      final response = await repoGetNowPlaying();
      if ((response.nowPlayingList ?? []).isNotEmpty) {
        nowPlayingList.addAll(response.nowPlayingList ?? []);
      }
      nowPlayingLoading.value = false;
    } catch (e) {
      print(e);
      nowPlayingLoading.value = true;
    }
  }

  Future<void> fetchPopularMovie() async {
    popularList.clear();
    popularLoading.value = true;
    try {
      final response = await repoGetPopular();
      if ((response.moviePopularList ?? []).isNotEmpty) {
        popularList.addAll(response.moviePopularList ?? []);
      }
      popularLoading.value = false;
    } catch (e) {
      print(e);
      popularLoading.value = true;
    }
  }

  Future<void> fetchGenres() async {
    genres.clear();
    genresLoading.value = true;
    try {
      final response = await repoGetGenres();
      if (response.isNotEmpty) {
        genres.addAll(response);
        log('test Data Genres ::: $genres');
      }
      genresLoading.value = false;
    } catch (e) {
      print(e);
      genresLoading.value = true;
    }
  }

  Future<List<MovieByGenre>> fetchMovieByGenres(int genreId) async {
    List<MovieByGenre> movieByGenreList = <MovieByGenre>[];

    try {
      final response = await repoGetMovieByGenres(genreId: genreId);
      if ((response.movieByGenreList ?? []).isNotEmpty) {
        movieByGenreList.addAll(response.movieByGenreList ?? []);
      }
    } catch (e) {
      print(e);
    }

    return movieByGenreList;
  }

  void changeHeadlineIndex(int index) {
    nowPlayingIndex.value = index;
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
