import 'package:flutter/material.dart';
import 'package:tmdb/widget/person_details_widget.dart';

class PeopleDetailScreen extends StatelessWidget {
  const PeopleDetailScreen({super.key, required this.name, required this.id});
  final String name;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: PersonDetailsWidget(id: id),
    );
  }
}
