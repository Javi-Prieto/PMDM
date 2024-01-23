import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb/models/popular_people_response/popular_people_response.dart';
import 'package:tmdb/widget/people_item.dart';

Future<PopularPeopleResponse> fetchPeople() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/popular?api_key=fab7d493325528d418b4366ba529f773'));
  if (response.statusCode == 200) {
    final toReturn = PopularPeopleResponse.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}

class PeopleWidget extends StatefulWidget {
  const PeopleWidget({super.key});

  @override
  State<PeopleWidget> createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> {
  late Future<PopularPeopleResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<PopularPeopleResponse>(
        future: peopleResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Skeletonizer(
                enabled: false,
                child: ListView.builder(
                    itemCount: snapshot.data!.results!.length,
                    itemBuilder: (context, index) {
                      return PeopleItem(
                        person: snapshot.data!.results![index],
                      );
                    }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
