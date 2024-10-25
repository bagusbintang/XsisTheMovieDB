import 'package:assignment_test_xsis/module/home/data/model/now_playing/now_playing.dart';
import 'package:assignment_test_xsis/module/home/data/model/now_playing/now_playing_dates.dart';

class NowPlayingResponse {
  NowPlayingDates? dates;
  int? page;
  List<NowPlaying>? nowPlayingList;
  int? totalPages;
  int? totalResults;

  NowPlayingResponse(
      {this.dates,
      this.page,
      this.nowPlayingList,
      this.totalPages,
      this.totalResults});

  NowPlayingResponse.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new NowPlayingDates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      nowPlayingList = <NowPlaying>[];
      json['results'].forEach((v) {
        nowPlayingList!.add(new NowPlaying.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dates != null) {
      data['dates'] = this.dates!.toJson();
    }
    data['page'] = this.page;
    if (this.nowPlayingList != null) {
      data['results'] = this.nowPlayingList!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}