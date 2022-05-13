import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies/models/index.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'ab0f52993856c0065d1a7b7d831007b1';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    final response = await http.get(url);
    onDisplayMovies = PlayingResponse.fromJson(response.body).movies;

    notifyListeners();
  }

  getPopularMovies() async {
    var ulr = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language});

    final response = await http.get(ulr);
    popularMovies = PlayingResponse.fromJson(response.body).movies;

    notifyListeners();
  }
}
