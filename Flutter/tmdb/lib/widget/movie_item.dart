import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/models/popular_movie_response/result.dart';
import 'package:tmdb/screen/movie_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final Result movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => MovieDetailScreen(
                    id: movie.id!,
                    name: movie.title!,
                  )),
        );
      },
      child: Card(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 150,
              height: 300,
              child: Stack(children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
              ]),
            )),
      ),
    );
  }
}
