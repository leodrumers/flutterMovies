import 'package:flutter/material.dart';
import 'package:movies/widgets/index.dart';

class DeatailsScreen extends StatelessWidget {
  const DeatailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MoviesAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            MoviePosterAndTitle(),
            MovieOverView(),
            MovieCastingCard(),
          ])),
        ],
      ),
    );
  }
}
