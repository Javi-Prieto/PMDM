import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/movie_videos_response/movie_videos_response.dart';
import 'package:tmdb/widget/movie_videos_item.dart';

Future<MovieVideosResponse> fetchTrailers(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/$id/videos?api_key=fab7d493325528d418b4366ba529f773'));
  if (response.statusCode == 200) {
    final toReturn = MovieVideosResponse.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}

class MovieVideosWidget extends StatefulWidget {
  const MovieVideosWidget({super.key, required this.id});
  final int id;
  @override
  State<MovieVideosWidget> createState() => _MovieVideosWidgetState();
}

class _MovieVideosWidgetState extends State<MovieVideosWidget> {
  late Future<MovieVideosResponse> movieDetailResponse;

  @override
  void initState() {
    super.initState();
    movieDetailResponse = fetchTrailers(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<MovieVideosResponse>(
        future: movieDetailResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.results!.isEmpty) {
              return const Text('No tenemos Trailers');
            }
            return SizedBox(
                width: 200,
                height: 400,
                child: GridView.builder(
                  itemCount: snapshot.data!.results!.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    mainAxisExtent: 400,
                  ),
                  itemBuilder: (context, index) {
                    return MovieVideosItem(
                        videoKey: snapshot.data!.results![index].key!);
                  },
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
