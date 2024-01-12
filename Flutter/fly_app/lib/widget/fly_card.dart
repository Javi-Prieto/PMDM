import 'package:flutter/material.dart';

class FlyCard extends StatelessWidget {
  final String llegada, salida, iataL, iataS, line;
  final DateTime fechaSalida;
  final int duracionHoras;


  

  const FlyCard({super.key, required this.duracionHoras, required this.fechaSalida, required this.iataL, required this.iataS, required this.llegada, required this.salida});


  @override
  Widget build(BuildContext context) {
    int durationHours = duracionHoras ~/ 60;
    int durationMinutes = duracionHoras % 60;
    String horaSalida = '${fechaSalida.hour}:${fechaSalida.minute}';
    String horaLlegada = '${fechaSalida.hour + durationHours}:${fechaSalida.hour + durationMinutes}';
    String duration = 'Duración ${durationHours}h ${durationMinutes}min';

    return  Center(
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(horaSalida),
                    const Text('SALIDA')
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(iataS),
                        Text(salida)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.airplanemode_active),
                        Text(line)
                      ],
                    ),
                    Text(duration)
                  ],
                )
              ],
            ),
            Row()
          ],
        )
      ),
    );
  }
}