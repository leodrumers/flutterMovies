import 'package:flutter/material.dart';

import '../models/index.dart';

class MovieSearchItem extends StatelessWidget {
  final Movie movie;

  const MovieSearchItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      trailing: Text(movie.voteAverage.toString()),
      leading: FadeInImage(
        image: NetworkImage(movie.fullPosterPath),
        placeholder: const AssetImage('assets/images/no-image.jpg'),
        width: 60,
        fit: BoxFit.contain,
      ),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
    );
  }
}
