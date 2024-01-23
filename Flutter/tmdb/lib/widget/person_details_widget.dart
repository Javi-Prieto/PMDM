import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/person_details_response.dart';
import 'package:tmdb/widget/person_detail_item.dart';

Future<PersonDetailsResponse> fetchPersonDetails(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/$id?api_key=fab7d493325528d418b4366ba529f773'));
  if (response.statusCode == 200) {
    final toReturn = PersonDetailsResponse.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}

class PersonDetailsWidget extends StatefulWidget {
  const PersonDetailsWidget({super.key, required this.id});
  final int id;
  @override
  State<PersonDetailsWidget> createState() => _PersonDetailsWidgetState();
}

class _PersonDetailsWidgetState extends State<PersonDetailsWidget> {
  late Future<PersonDetailsResponse> personDetailResponse;

  @override
  void initState() {
    super.initState();
    personDetailResponse = fetchPersonDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<PersonDetailsResponse>(
        future: personDetailResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
                enabled: false,
                child: PersonDetailItem(person: snapshot.data!));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
