import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/models/request_token_response.dart';
import 'package:url_launcher/url_launcher.dart';

Future<RequestTokenResponse> fetchMovieDetails() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/authentication/token/new?api_key=fab7d493325528d418b4366ba529f773'));
  if (response.statusCode == 200) {
    final toReturn = RequestTokenResponse.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}

class RequestTokenWidget extends StatefulWidget {
  const RequestTokenWidget({super.key});
  @override
  State<RequestTokenWidget> createState() => _RequestTokenWidgetState();
}

class _RequestTokenWidgetState extends State<RequestTokenWidget> {
  late Future<RequestTokenResponse> movieDetailResponse;

  @override
  void initState() {
    super.initState();
    movieDetailResponse = fetchMovieDetails();
  }

  _launchUrl(request_token) async {
  if (!await launchUrl(Uri.parse('https://www.themoviedb.org/authenticate/${request_token}?http://localhost:65424/'))) {
    throw Exception('Could not launch ${Uri.parse('https://www.themoviedb.org/authenticate/${request_token}?http://localhost:65424/')}');
  }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
          child: FutureBuilder<RequestTokenResponse>(
            future: movieDetailResponse,
            builder: (context, snapshot) { 
              if(snapshot.hasData){
                return ElevatedButton(
                  onPressed: _launchUrl(snapshot.data!.requestToken!),
                  child: const Text('Show Flutter homepage'),
                );
              }else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
                return const CircularProgressIndicator();
            },
          ),
        ),
      );
}}