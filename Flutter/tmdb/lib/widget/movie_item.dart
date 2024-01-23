import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/popular_movie_response/result.dart';
import 'package:tmdb/screen/movie_detail_screen.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final Result movie;
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
                          movie.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(movie.originalTitle!,
                            style: const TextStyle(color: Colors.white54))
                      ],
                    ),
                    Image(
                      image: NetworkImage(
                          'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${movie.posterPath!}'),
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
                              '${movie.popularity!}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Text('Popularity',
                                style: TextStyle(color: Colors.white54))
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.movie_filter,
                              color: Colors.white,
                            ),
                            Text('${movie.voteAverage}⭐',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            const Text('Vote Average',
                                style: TextStyle(color: Colors.white54))
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                            Text('${movie.releaseDate}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            const Text('Release Date',
                                style: TextStyle(color: Colors.white54))
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ),
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => MovieDetailScreen(
                          name: movie.title!,
                          id: movie.id!,
                        )));
          },
        ),
      ),
    );
  }
}
