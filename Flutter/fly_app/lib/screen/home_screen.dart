import 'package:flutter/material.dart';
import 'package:fly_app/widget/fly_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(
          'Viajes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
      body: ListView(
        children: [
          FlyCard(
              duracionMinutes: 90,
              fechaSalida: DateTime.now(),
              iataL: 'LHR',
              iataS: 'MAD',
              llegada: 'Londres',
              salida: 'Madrid',
              line: 'Iberia 7448'),
          FlyCard(
              duracionMinutes: 120,
              fechaSalida: DateTime.now(),
              iataL: 'LHR',
              iataS: 'SVQ',
              llegada: 'Londres',
              salida: 'Sevilla',
              line: 'Iberia 748'),
          FlyCard(
              duracionMinutes: 90,
              fechaSalida: DateTime.now(),
              iataL: 'MAD',
              iataS: 'CS',
              llegada: 'Madrid',
              salida: 'Caracas',
              line: 'Iberia 8448'),
          FlyCard(
              duracionMinutes: 90,
              fechaSalida: DateTime.now(),
              iataL: 'BLA',
              iataS: 'ABQ',
              llegada: 'Barcelona',
              salida: 'Albuquerque',
              line: 'Iberia 7448')
        ],
      ),
    );
  }
}
