import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies/providers/index.dart';
import 'package:movies/widgets/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Details'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(children: [
        CardSwiper(
          movies: moviesProvider.onDisplayMovies,
        ),
        MovieSlider(
          popularMovies: moviesProvider.popularMovies,
          title: 'Top movies',
          onNextPage: () => moviesProvider.getPopularMovies(),
        ),
      ]),
    );
  }
}
