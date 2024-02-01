import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/models/request_token_response.dart';
import 'package:url_launcher/url_launcher.dart';

setRequestToken(String requestToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('request_token', requestToken);
}

Future<RequestTokenResponse> fetchRequestToken() async {
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
  late Future<RequestTokenResponse> requestTokenResponse;

  @override
  void initState() {
    super.initState();
    requestTokenResponse = fetchRequestToken();
  }

  _launchUrl(requestToken) async {
    if (!await launchUrl(Uri.parse(
        'https://www.themoviedb.org/authenticate/$requestToken?redirect_to=http://localhost:58734/'))) {
      throw Exception(
          'Could not launch ${Uri.parse('https://www.themoviedb.org/authenticate/$requestToken?redirect_to=http://localhost:65424/')}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: FutureBuilder<RequestTokenResponse>(
          future: requestTokenResponse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              setRequestToken(snapshot.data!.requestToken!);
              return ElevatedButton(
                onPressed: _launchUrl(snapshot.data!.requestToken!),
                child: const Text('Show Flutter homepage'),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
