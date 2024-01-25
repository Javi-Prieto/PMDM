import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/movie_videos_response/movie_videos_response.dart';
import 'package:tmdb/screen/movie_detail_screen.dart';

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
            return Skeletonizer(
                enabled: false,
                child: ListView.builder(
                  itemCount: snapshot.data!.results!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, 
                          CupertinoPageRoute(builder: (context) => MovieDetailScreen(name: 'hola', id: widget.id))
                        );
                      },
                      child: Text('https://stackoverflow.com/questions/2068344/how-do-i-get-a-youtube-video-thumbnail-from-the-youtube-api#:~:text=In%20YouTube%20Data%20API%20v3,its%20width%2C%20height%20and%20URL.'),
                    );
                  }
          )
          );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
