import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/person_details_response.dart';

class PersonDetailItem extends StatelessWidget {
  const PersonDetailItem({super.key, required this.person});
  final PersonDetailsResponse person;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ShakeAnimation(
            duration: const Duration(milliseconds: 900),
            child: Image(
                image: NetworkImage(
                    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${person.profilePath!}')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.date_range),
                  Text(person.birthday!)
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.movie),
                  Text(person.knownForDepartment!)
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star),
                  Text('${person.popularity!}')
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(person.biography!)
        ],
      ),
    );
  }
}

class ShakeAnimation extends StatelessWidget {
  const ShakeAnimation(
      {super.key,
      required this.child,
      required this.duration,
      this.offset = 140.0});
  final Widget child;
  final Duration duration;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: duration,
        curve: Curves.bounceOut,
        builder: ((context, value, child) {
          return Transform.translate(
            offset: Offset(value * offset, 0.0),
            child: child,
          );
        }),
        child: child);
  }
}
