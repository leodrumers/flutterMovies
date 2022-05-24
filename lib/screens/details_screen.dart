import 'package:flutter/material.dart';

import 'package:movies/models/index.dart';
import 'package:movies/widgets/index.dart';

class DeatailsScreen extends StatelessWidget {
  const DeatailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MoviesAppBar(movie: movie),
          SliverList(
            delegate: SliverChildListDelegate([
              MoviePosterAndTitle(movie: movie),
              MovieOverView(movie: movie),
              MovieCastingCard(movieId: movie.id),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Crew List',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              MovieCastingCard(
                movieId: movie.id,
                showCrew: true,
              ),
              const SizedBox(height: 25),
            ]),
          ),
        ],
      ),
    );
  }
}
