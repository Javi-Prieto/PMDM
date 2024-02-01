import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb/widget/auth/create_session_widget.dart';
import 'package:tmdb/widget/auth/request_token_widget.dart';

Future<String> getRequestToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString('request_token')!;
  return stringValue;
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<String> requestToken;

  @override
  initState() {
    super.initState();
    requestToken = getRequestToken();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: requestToken,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CreateSessionWidget(
              requestToken: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            if (snapshot.error.toString() == 'Unexpected null value.') {
              return const RequestTokenWidget();
            } else {
              return Text('${snapshot.error}');
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
