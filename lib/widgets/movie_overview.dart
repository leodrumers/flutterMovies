import 'package:flutter/material.dart';

class MovieOverView extends StatelessWidget {
  const MovieOverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Cillum eiusmod occaecat minim culpa qui dolore ipsum culpa. Laborum et exercitation culpa adipisicing incididunt ea aute ea. Est amet mollit in aute. Mollit elit consequat aliqua ea qui veniam nostrud laborum cupidatat amet aliquip aliqua. Dolore qui officia id consectetur consectetur. Voluptate duis dolore exercitation ex dolore Lorem. Culpa proident aliquip elit aliqua enim culpa reprehenderit.',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
