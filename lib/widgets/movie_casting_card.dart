import 'package:flutter/material.dart';

class MovieCastingCard extends StatelessWidget {
  const MovieCastingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => CastingCard(),
        itemCount: 10,
      ),
    );
  }
}

class CastingCard extends StatelessWidget {
  const CastingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: 150,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/150x300'),
            fit: BoxFit.cover,
            width: 100,
            height: 140,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'movie.actoname loereifenf',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
