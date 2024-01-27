import 'package:flutter/material.dart';
import 'package:google_map_salesianos/widgets/place_marker_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salesianos Location'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: false,
        children: const [
          Text(
            'Where are Salesianos Triana',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          PlaceMarkerItem(),
        ],
      ),
    );
  }
}
