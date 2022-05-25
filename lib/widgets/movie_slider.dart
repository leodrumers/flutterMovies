import 'package:flutter/material.dart';
import 'package:movies/models/index.dart';

import 'movie_poster.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> popularMovies;
  final String title;
  final Function onNextPage;

  const MovieSlider(
      {Key? key,
      required this.popularMovies,
      required this.title,
      required this.onNextPage})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final position = _scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.popularMovies.length,
              itemBuilder: (_, index) {
                var movie = widget.popularMovies[index];
                var heroId = 'slider-${movie.id}-$index';
                movie.heroId = heroId;
                return MoviePoster(movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}
