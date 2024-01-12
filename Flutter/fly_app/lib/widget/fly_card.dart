import 'package:flutter/material.dart';

class FlyCard extends StatelessWidget {
  final String llegada, salida, iataL, iataS, line;
  final DateTime fechaSalida;
  final int duracionMinutes;


  

  const FlyCard({super.key, required this.duracionMinutes, required this.fechaSalida, required this.iataL, required this.iataS, required this.llegada, required this.salida, required this.line});


  @override
  Widget build(BuildContext context) {
    int durationHours = duracionMinutes ~/ 60;
    double durationMinutes = duracionMinutes % 60;
    String horaSalida = '${fechaSalida.hour}:${fechaSalida.minute}';
    String horaLlegada = '${fechaSalida.hour + durationHours}:${fechaSalida.hour + durationMinutes}';
    String duration = 'Duración ${durationHours}h ${durationMinutes}min';

    return  Center(
      child: Card(
        margin: const EdgeInsets.all(25),
        elevation: 2,
        shape: const ContinuousRectangleBorder(),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20,),
                Column(
                  children: [
                    Text(horaSalida),
                    const Text('SALIDA')
                  ],
                ),
                const SizedBox(width: 50,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                          child: Text('$iataL ',  style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ), textAlign: TextAlign.center,),
                        ),
                        Text(salida,  style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.airplanemode_active, color: Colors.grey,),
                        Text(' $line' ,style: const TextStyle(
                          fontSize: 15
                          , color: Colors.grey
                        ))
                      ],
                    ),
                    Text(duration,style: const TextStyle(
                          fontSize: 15
                          , color: Colors.grey
                        ))
                  ],
                ),
                
                

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20,),
                Column(
                  children: [
                    Text(horaLlegada, textAlign: TextAlign.start,),
                    const Text('LLEGADA',)
                  ],
                ),
                
                const SizedBox(width: 50,),
                
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                          child: Text('$iataL ',  style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ), textAlign: TextAlign.center,),
                        ),
                        Text(llegada,  style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ))
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        )
      ),
    );
  }
}