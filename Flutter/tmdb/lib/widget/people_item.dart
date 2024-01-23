import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/popular_people_response/result.dart';
import 'package:tmdb/screen/person_detail_screen.dart';

class PeopleItem extends StatelessWidget {
  const PeopleItem({super.key, required this.person});
  final Result person;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        padding: const EdgeInsets.all(5),
        child: InkWell(
          child: Card(
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.black, Colors.purple],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          person.name!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(person.gender == 0 ? 'Female' : 'Male',
                            style: const TextStyle(color: Colors.white54))
                      ],
                    ),
                    Image(
                      image: NetworkImage(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${person.profilePath!}'),
                      width: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Icon(
                              Icons.numbers,
                              color: Colors.white,
                            ),
                            Text(
                              person.knownForDepartment!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text('Department',
                                style: TextStyle(color: Colors.white54))
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.movie_filter,
                              color: Colors.white,
                            ),
                            Text('${person.knownFor?.length}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            const Text('Number of Films',
                                style: TextStyle(color: Colors.white54))
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.add_chart_rounded,
                              color: Colors.white,
                            ),
                            Text('${person.popularity}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            const Text('Popularity',
                                style: TextStyle(color: Colors.white54))
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ),
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context) =>  PeopleDetailScreen(name: person.name!, id: person.id!,)));
          },
        ),
      ),
    );
  }
}
