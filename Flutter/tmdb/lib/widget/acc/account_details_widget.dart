import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/account_details_response/account_details_response.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/widget/acc/account_details_item.dart';

class AccountDetailsWidget extends StatefulWidget {
  const AccountDetailsWidget({super.key, required this.sessionId});
  final String sessionId;
  @override
  State<AccountDetailsWidget> createState() => _AccountDetailsWidgetState();
}

class _AccountDetailsWidgetState extends State<AccountDetailsWidget> {
  late Future<AccountDetailsResponse> accountDetailsResponse;

  @override
  void initState() {
    super.initState();
    accountDetailsResponse = fetchMovieDetails(widget.sessionId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<AccountDetailsResponse>(
        future: accountDetailsResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
                enabled: false,
                child: AccountDetailsItem(
                  account: snapshot.data!,
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

Future<AccountDetailsResponse> fetchMovieDetails(String sessionId) async {
  final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/account/?session_id=$sessionId'));
  if (response.statusCode == 200) {
    final toReturn = AccountDetailsResponse.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}
