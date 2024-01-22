import 'package:flutter/material.dart';
import 'package:valencias_parking/models/parking_list/result.dart';

class ParkingItem extends StatelessWidget {
  const ParkingItem({super.key, required this.parking});
  final Result parking;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        padding: const EdgeInsets.all(5),
        child: Card(
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(6))),
          child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(6)),
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.black, Colors.purple],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        parking.nombre!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(parking.direccion!,
                          style: const TextStyle(color: Colors.white54))
                    ],
                  ),
                  const Image(
                      image: NetworkImage(
                          'https://static.wixstatic.com/media/5e6c0f_d8fcd45c87174e9cb8161fa7ec55cfc5~mv2.png/v1/fill/w_610,h_268,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/MC20_front.png')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.numbers,
                            color: Colors.white,
                          ),
                          Text(
                            '${parking.plazastota}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text('Plazas Totales',
                              style: TextStyle(color: Colors.white54))
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            parking.plazaslibr! > 0
                                ? Icons.check_circle
                                : Icons.close,
                            color: parking.plazaslibr! > 0
                                ? Colors.green
                                : Colors.red,
                          ),
                          Text('${parking.plazaslibr}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const Text('Plazas libres',
                              style: TextStyle(color: Colors.white54))
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.date_range, color: Colors.white,),
                          Text(
                              parking.ultimaMod.toString() == 'null'
                                  ? 'Sin datos'
                                  : parking.ultimaMod
                                      .toString()
                                      .substring(0, 10),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const Text('Fecha de actualización',
                              style: TextStyle(color: Colors.white54))
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
