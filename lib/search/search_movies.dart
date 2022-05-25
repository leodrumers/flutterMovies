import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/index.dart';
import '../providers/index.dart';
import '../widgets/index.dart';

class SearchMovie extends SearchDelegate {
  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        size: 100,
        color: Colors.black45,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildMovieList(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildMovieList(context);
  }

  Widget buildMovieList(BuildContext context) {
    if (query.isEmpty) return _emptyContainer();

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query: query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) =>
              MovieSearchItem(movie: movies[index]),
        );
      },
    );
  }
}
