import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies/models/index.dart';
import 'package:movies/models/search_reponse.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'ab0f52993856c0065d1a7b7d831007b1';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};
  Map<int, List<Cast>> moviesCrew = {};
  Map<String, List<Movie>> searchedMovies = {};

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

  Future<List<Cast>> getMovieCast(int movieId, bool showCrew) async {
    if (moviesCast.containsKey(movieId)) {
      return showCrew ? moviesCrew[movieId]! : moviesCast[movieId]!;
    }

    String data = await _getMoviesData('3/movie/$movieId/credits');
    Credit casting = Credit.fromJson(data);
    moviesCast[movieId] = casting.cast;
    moviesCrew[movieId] = casting.crew;

    return showCrew ? casting.crew : casting.cast;
  }

  Future<String> _getMoviesData(String path, [int page = 1]) async {
    var ulr = Uri.https(_baseUrl, path,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(ulr);
    return response.body;
  }

  Future<List<Movie>> searchMovies(
      {int page = 1, required String query}) async {
    if (searchedMovies.containsKey(query)) return searchedMovies[query]!;

    var ulr = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
      'query': query,
    });

    final response = await http.get(ulr);
    final searchResponse = SearchResponse.fromJson(response.body);
    searchedMovies[query] = searchResponse.results;

    return searchedMovies[query]!;
  }
}
