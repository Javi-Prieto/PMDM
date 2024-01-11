import 'package:flutter/material.dart';
import 'package:flutter_lateral_scrollable/widget/actor_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Actors and Actresses',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          elevation: 1,
          leading: const Icon(
            Icons.accessible_rounded,
            size: 40,
          )),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ActorItem(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
            name: 'Chris',
            firstName: 'Hemsworth',
          ),
          ActorItem(
            imageUrl:
                'https://m.media-amazon.com/images/M/MV5BMjI4NjM1NDkyN15BMl5BanBnXkFtZTgwODgyNTY1MjE@._V1_.jpg',
            name: 'Enma',
            firstName: 'Stones',
          ),
          ActorItem(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Michael_B._Jordan_Cannes_2018.jpg/1200px-Michael_B._Jordan_Cannes_2018.jpg',
            name: 'Michael B.',
            firstName: 'Jordan',
          ),
          ActorItem(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Robbie_at_2019_Cannes_%28cropped%29.jpg/220px-Robbie_at_2019_Cannes_%28cropped%29.jpg',
            name: 'Margot',
            firstName: 'Robbie',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
              ),
              label: 'Booking'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        backgroundColor: Colors.grey.shade500,
        selectedItemColor: Colors.grey.shade800,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
