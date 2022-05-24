import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/index.dart';
import '../providers/index.dart';

import './casting_card.dart';

class MovieCastingCard extends StatelessWidget {
  final int movieId;
  final bool showCrew;

  const MovieCastingCard(
      {Key? key, required this.movieId, this.showCrew = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId, showCrew),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            constraints: const BoxConstraints(maxWidth: 150),
            height: 200,
            child: const CupertinoActivityIndicator(),
          );
        }

        List<Cast> castList = snapshot.data!;

        // Todo: Improve heiht rendering
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: showCrew ? 250 : 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: castList.length,
            itemBuilder: (_, index) => CastingCard(cast: castList[index]),
          ),
        );
      },
    );
  }
}
