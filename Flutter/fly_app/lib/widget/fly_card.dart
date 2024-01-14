import 'package:flutter/material.dart';

class FlyCard extends StatelessWidget {
  final String llegada, salida, iataL, iataS, line;
  final DateTime fechaSalida;
  final int duracionMinutes;

  const FlyCard(
      {super.key,
      required this.duracionMinutes,
      required this.fechaSalida,
      required this.iataL,
      required this.iataS,
      required this.llegada,
      required this.salida,
      required this.line});

  @override
  Widget build(BuildContext context) {
    int durationHours = duracionMinutes ~/ 60;
    double durationMinutes = duracionMinutes % 60;
    String horaSalida = '${fechaSalida.hour}:${fechaSalida.minute}';
    String horaLlegada =
        '${fechaSalida.hour + durationHours}:${fechaSalida.hour + durationMinutes}';
    String duration = 'Duración ${durationHours}h ${durationMinutes}min';

    return Center(
      child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(25),
          shape: const ContinuousRectangleBorder(),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        horaSalida,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'SALIDA',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.grey.shade600),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            margin: const EdgeInsets.only(right: 5, bottom: 2),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2))),
                            child: Text(
                              '$iataS ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(salida,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Image(
                            image: NetworkImage(
                                'https://assets-global.website-files.com/63d1baf79ce0eb802868785b/644f8fc42156f6c5fbdff987_iberia-airlines-logo.png'),
                            width: 20,
                          ),
                          Text(' $line',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey))
                        ],
                      ),
                      Text(duration,
                          style:
                              const TextStyle(fontSize: 15, color: Colors.grey))
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
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(horaLlegada,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(
                        'LLEGADA',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.grey.shade600),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: const EdgeInsets.all(3.0),
                              margin:
                                  const EdgeInsets.only(right: 5, bottom: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2))),
                              child: Text(
                                '$iataL ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              )),
                          Text(llegada,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
