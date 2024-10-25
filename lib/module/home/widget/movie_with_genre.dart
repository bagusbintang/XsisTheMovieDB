import 'package:assignment_test_xsis/common/strings.dart';
import 'package:assignment_test_xsis/module/home/controller/home_controller.dart';
import 'package:assignment_test_xsis/module/home/data/model/movie_list/movie_by_genre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieWithGenre extends StatefulWidget {
  const MovieWithGenre({
    super.key,
    required this.controller,
    required this.genreId,
  });

  final HomeController controller;
  final int genreId;

  @override
  State<MovieWithGenre> createState() => _MovieWithGenreState();
}

class _MovieWithGenreState extends State<MovieWithGenre> {
  List<MovieByGenre> movies = <MovieByGenre>[];

  final isLoading = false.obs;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() async {
    movies.clear();
    isLoading.value = true;
    try {
      movies = await widget.controller.fetchMovieByGenres(widget.genreId);
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return AspectRatio(
        aspectRatio: 3 / 2,
        child: SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var item = movies[index];
              return moviesItem(item);
            },
          ),
        ),
      );
    });
  }

  Widget moviesItem(MovieByGenre movie) {
    return GestureDetector(
      onTap: () => widget.controller.showDetail(movieId: movie.id ?? 0),
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        margin: const EdgeInsets.only(
          right: 16,
        ),
        width: 200,
        decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              //'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum molestie egestas vehicula. Proin id turpis semper, gravida lectus id, mollis tortor. Aliquam vel augue sagittis, aliquam mauris id, finibus augue. Curabitur velit mi, accumsan in ligula et, viverra posuere erat. Donec sollicitudin tincidunt orci nec aliquet. Phasellus finibus placerat elementum. Praesent in vulputate velit. Etiam aliquam id massa in placerat. Aenean molestie urna mi, vitae iaculis odio maximus eu.',
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Image.network(
              TMBDStrings.getThumbImg +
                  movie.posterPath
                      .toString(), //'https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn2.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQeZl5f7yIvMVDPbWnJdds7oedgLAxvmVDCaYrmDlcMaNx9DvVb&psig=AOvVaw0vKhH9AbEPyb4YvggTFAZe&ust=1729844686839000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCICpy-LLpokDFQAAAAAdAAAAABAE',
              width: 160,
              height: 160,
            ),
          ],
        ),
      ),
    );
  }
}
