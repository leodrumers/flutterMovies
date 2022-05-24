import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies/models/index.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'ab0f52993856c0065d1a7b7d831007b1';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _currentPage = 1;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    String data = await _getMoviesData('3/movie/now_playing');
    onDisplayMovies = PlayingResponse.fromJson(data).movies;

    notifyListeners();
  }

  getPopularMovies() async {
    String data = await _getMoviesData('3/movie/popular', _currentPage);
    popularMovies = [
      ...popularMovies,
      ...PlayingResponse.fromJson(data).movies
    ];

    _currentPage++;
    notifyListeners();
  }

  getCredits(int movieId) async {
    String data = await _getMoviesData('3/movie/$movieId/credits');
    popularMovies = [
      ...popularMovies,
      ...PlayingResponse.fromJson(data).movies
    ];
    notifyListeners();
  }

  Future<String> _getMoviesData(String path, [int page = 1]) async {
    var ulr = Uri.https(_baseUrl, path,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(ulr);
    return response.body;
  }
}
