import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/create_session_response.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/widget/acc/account_details_widget.dart';

class CreateSessionWidget extends StatefulWidget {
  const CreateSessionWidget({super.key, required this.requestToken});
  final String requestToken;
  @override
  State<CreateSessionWidget> createState() => _CreateSessionWidgetState();
}

class _CreateSessionWidgetState extends State<CreateSessionWidget> {
  late Future<CreateSessionResponse> movieDetailResponse;

  @override
  void initState() {
    super.initState();
    movieDetailResponse = createSessionId(widget.requestToken);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<CreateSessionResponse>(
        future: movieDetailResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
                enabled: false,
                child: AccountDetailsWidget(
                  sessionId: snapshot.data!.sessionId!,
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

Future<CreateSessionResponse> createSessionId(String requestToken) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'request_token': requestToken,
    }),
  );

  if (response.statusCode == 201) {
    return CreateSessionResponse.fromJson(jsonDecode(response.body) as String);
  } else {
    throw Exception('Failed to create a session id.');
  }
}
