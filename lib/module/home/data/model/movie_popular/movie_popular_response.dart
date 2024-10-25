import 'package:assignment_test_xsis/module/home/data/model/movie_popular/movie_popular.dart';

class MoviePopularResponse {
  int? page;
  List<MoviePopular>? moviePopularList;
  int? totalPages;
  int? totalResults;

  MoviePopularResponse(
      {this.page, this.moviePopularList, this.totalPages, this.totalResults});

  MoviePopularResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      moviePopularList = <MoviePopular>[];
      json['results'].forEach((v) {
        moviePopularList!.add(new MoviePopular.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.moviePopularList != null) {
      data['results'] = this.moviePopularList!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}