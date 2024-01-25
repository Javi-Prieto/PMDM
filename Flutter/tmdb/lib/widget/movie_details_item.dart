import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tmdb/models/movie_details_response/movie_details_response.dart';
import 'package:tmdb/widget/movie_videos_widget.dart';

class MovieDetailsItem extends StatelessWidget {
  const MovieDetailsItem({super.key, required this.movie});
  final MovieDetailsResponse movie;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          ShakeAnimation(
            duration: const Duration(milliseconds: 900),
            child: Image(
                image: NetworkImage(
                    'https://media.themoviedb.org/t/p/w300_and_h450_bestv2${movie.posterPath!}')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  for (var genre in movie.genres!) Text('| ${genre.name!} |')
                ],
              ),
              CircularPercentIndicator(
                radius: 30,
                lineWidth: 3,
                percent: movie.voteAverage! / 10,
                center: Text('${(movie.voteAverage!).roundToDouble()}⭐'),
                progressColor: Colors.deepPurple,
              )
            ],
          ),
          const Divider(),
          const Text(
            'OVERVIEW',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),
          Text(movie.overview!),
          const Divider(),
          const Text(
            'TRAILERS',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),
          MovieVideosWidget(id: movie.id!),
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
