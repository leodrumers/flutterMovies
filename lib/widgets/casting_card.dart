import 'package:flutter/material.dart';

import '../models/index.dart';

class CastingCard extends StatelessWidget {
  final Cast cast;

  const CastingCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/no-image.jpg'),
            image: NetworkImage(cast.fullProfilePath),
            fit: BoxFit.cover,
            width: 100,
            height: 140,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          cast.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        if (cast.knownForDepartment != 'Acting') const SizedBox(height: 5),
        if (cast.knownForDepartment != 'Acting')
          Text(
            cast.knownForDepartment,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
      ]),
    );
  }
}
