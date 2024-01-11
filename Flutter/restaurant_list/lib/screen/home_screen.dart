import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_list/widget/restaurant_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Best European Restaurants'),),
      body: ListView(
        
        children: const [
          ResturantItem(name: 'Le Clarence', 
          imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/17/45/4e/fb/le-clarence.jpg', 
          address: '31 Av. Franklin Delano Roosevelt, 75008 Paris, Francia', 
          avgPrice: 180, 
          avgRating: 4),
          ResturantItem(name: 'Alchemist', 
          imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/19/1d/46/4e/alchemists-main-dining.jpg', 
          address: 'Refshalevej 173C, 1432 København K, Dinamarca', 
          avgPrice: 558, 
          avgRating: 5),
          ResturantItem(name: 'Taberna Paco', 
          imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/12/d3/59/89/photo0jpg.jpg', 
          address: 'Calle Alfareria 18, 41010 Sevilla España', 
          avgPrice: 50, 
          avgRating: 3),
          ResturantItem(name: 'Asador Etxebarri', 
          imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/17/09/88/77/caption.jpg', 
          address: 'Plaza de San Juan, 1 Axpe, Axpe Achondo España', 
          avgPrice: 155, 
          avgRating: 4),
          ResturantItem(name: 'Bagá', 
          imageUrl: 'https://media-cdn.tripadvisor.com/media/photo-s/18/98/69/48/photo3jpg.jpg', 
          address: 'Calle Reja de la Capilla 3, 23001 Jaén España', 
          avgPrice: 201, 
          avgRating: 5)

        ],
      ),
    );
  }
}