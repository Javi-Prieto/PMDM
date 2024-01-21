import 'package:flutter/material.dart';
import 'package:valencias_parking/widgets/parking_list_widget.dart';

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
        title: const Text('Valencia Parkings'),
        centerTitle: true,
        leading: const Icon(Icons.car_rental_rounded),
      ),
      body: const ParkingList(),
    );
  }
}
