import 'package:assignment_test_xsis/module/home/data/model/movie_list/movie_by_genre.dart';

class MovieByGenresResponse {
  int? page;
  List<MovieByGenre>? movieByGenreList;
  int? totalPages;
  int? totalResults;

  MovieByGenresResponse(
      {this.page, this.movieByGenreList, this.totalPages, this.totalResults});

  MovieByGenresResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movieByGenreList = <MovieByGenre>[];
      json['results'].forEach((v) {
        movieByGenreList!.add(new MovieByGenre.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.movieByGenreList != null) {
      data['results'] = this.movieByGenreList!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}