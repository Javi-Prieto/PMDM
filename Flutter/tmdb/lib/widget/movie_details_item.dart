import 'package:flutter/material.dart';
import 'package:tmdb/models/movie_details_response/movie_details_response.dart';


class MovieDetailsItem extends StatelessWidget {
  const MovieDetailsItem({super.key, required this.movie});
  final MovieDetailsResponse movie;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
                image: NetworkImage(
                    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${movie.posterPath!}')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    Text(movie.releaseDate!)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    for(var genre in movie.genres! ) Text('| ${genre.name!} |')
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.star),
                    Text('${movie.voteAverage!}')
                  ],
                ),
              ],
            ),
            Text(movie.overview!)
          ],
        ),
      ),
    );
  }
}