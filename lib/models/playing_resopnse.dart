import 'dart:convert';

import 'movie.dart';

class PlayingResponse {
  String? dates;
  int page;
  List<Movie> movies;
  int totalPages;
  int totalResults;

  PlayingResponse({
    this.dates,
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory PlayingResponse.fromJson(String str) =>
      PlayingResponse.fromMap(json.decode(str));

  factory PlayingResponse.fromMap(Map<String, dynamic> json) => PlayingResponse(
        dates: json["release_date"],
        page: json["page"],
        movies: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
