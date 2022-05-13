import 'package:flutter/material.dart';

class MoviePosterAndTitle extends StatelessWidget {
  const MoviePosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          child: FadeInImage(
            placeholder: AssetImage('assets/images/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 150,
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Movie.title',
              style: textTheme.headline4,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'Originial.titlefef',
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              children: [
                Icon(Icons.star_border_purple500_rounded),
                Text('movie.voteAverage', style: textTheme.caption)
              ],
            ),
          ],
        ),
      ]),
    );
  }
}