import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies/models/index.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'ab0f52993856c0065d1a7b7d831007b1';
  String _language = 'en-US';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    final response = await http.get(url);
    final playingResponse = PlayingResponse.fromJson(response.body);
    onDisplayMovies = playingResponse.movies;

    notifyListeners();
  }
}
