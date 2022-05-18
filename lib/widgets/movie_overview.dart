import 'package:flutter/material.dart';

import '../models/index.dart';

class MovieOverView extends StatelessWidget {
  final Movie movie;

  const MovieOverView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        movie.overview,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
