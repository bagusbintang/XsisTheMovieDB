import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/module/home/controller/home_controller.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_popular/movie_popular.dart';
import 'package:assignment_test_xsis/module/home/widget/movie_with_genre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieByGenre extends StatelessWidget {
  const MovieByGenre({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.genresLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.genres.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var genre = controller.genres[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  genre.name.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                MovieWithGenre(
                  controller: controller,
                  genreId: genre.id ?? 0,
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
