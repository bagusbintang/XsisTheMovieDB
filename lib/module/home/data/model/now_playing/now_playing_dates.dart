class NowPlayingDates {
  String? maximum;
  String? minimum;

  NowPlayingDates({this.maximum, this.minimum});

  NowPlayingDates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maximum'] = this.maximum;
    data['minimum'] = this.minimum;
    return data;
  }
}