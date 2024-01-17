import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bueno, bonito y MUY CARO', style: TextStyle(color: Colors.green),),
                  Text('No hay ofertas', style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image(image: NetworkImage('anyimage'),fit: BoxFit.contain, width: 200,)
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('name'),
                  Text('2-3 puertas ~ Cochazo', style: TextStyle(color: Colors.grey),),
                  Row(
                    children: [
                      Icon( Icons.gamepad_rounded ),
                      Text( 'Aut.'),
                      SizedBox(width: 5,),
                      Icon(Icons.snowing),
                      Text( 'A/A'),
                      SizedBox(width: 5,),
                      Icon( Icons.man),
                      Text('sites'),
                      SizedBox(width: 5,),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}