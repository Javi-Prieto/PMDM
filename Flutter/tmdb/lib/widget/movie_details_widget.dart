import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/movie_details_response/movie_details_response.dart';
import 'package:tmdb/widget/movie_details_item.dart';

Future<MovieDetailsResponse> fetchMovieDetails(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$id?api_key=fab7d493325528d418b4366ba529f773'));
  if (response.statusCode == 200) {
    final toReturn = MovieDetailsResponse.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({super.key, required this.id});
  final int id;
  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  late Future<MovieDetailsResponse> movieDetailResponse;

  @override
  void initState() {
    super.initState();
    movieDetailResponse = fetchMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<MovieDetailsResponse>(
        future: movieDetailResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
                enabled: false,
                child: MovieDetailsItem(movie: snapshot.data!));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
