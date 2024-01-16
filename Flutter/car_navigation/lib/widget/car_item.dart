import 'package:car_navigation/screen/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  const CarItem({super.key, required this.name, required this.isAutomatic, required this.sites, required this.price, required this.imageUrl});
  final String name, imageUrl;
  final bool isAutomatic;
  final int sites, price;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
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
              padding: const EdgeInsets.all(10),
              // ignore: sort_child_properties_last
              child:Material(child: InkWell(onTap: (){Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => DetailScreen(name: name, imageUrl: imageUrl),
                                                        ),
                                                      );}, child: Image(image: NetworkImage(imageUrl),fit: BoxFit.contain, width: 200,),), color: Colors.transparent, )
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  const Text('2-3 puertas ~ Cochazo', style: TextStyle(color: Colors.grey),),
                  Row(
                    children: [
                      Icon(isAutomatic? Icons.gamepad_rounded : Icons.handyman),
                      Text(isAutomatic? 'Aut.': 'Man.'),
                      const SizedBox(width: 5,),
                      const Icon(Icons.snowing),
                      const Text( 'A/A'),
                      const SizedBox(width: 5,),
                      const Icon( Icons.man),
                      Text('$sites'),
                      const SizedBox(width: 5,),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('€$price',  style: const TextStyle(color: Colors.blue)),
                  CupertinoButton(onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) =>  DetailScreen(name: name, imageUrl: imageUrl,)),
                    );
                  }, 
                  child: const Text('SELECCIONAR', style: TextStyle(color: Colors.blue)),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}