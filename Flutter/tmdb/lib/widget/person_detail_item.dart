import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/person_details_response.dart';

class PersonDetailItem extends StatelessWidget {
  const PersonDetailItem({super.key, required this.person});
  final PersonDetailsResponse person;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              image: NetworkImage(
                  'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${person.profilePath!}')),
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
          Text(person.biography!)
        ],
      ),
    );
  }
}
