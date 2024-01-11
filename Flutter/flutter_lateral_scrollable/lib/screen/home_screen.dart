import 'package:flutter/material.dart';
import 'package:flutter_lateral_scrollable/widget/actor_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Actors and Actresses')),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ActorItem(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Sydney_Sweeney_2019_by_Glenn_Francis.jpg/220px-Sydney_Sweeney_2019_by_Glenn_Francis.jpg',
              name: 'Sidney'),
          ActorItem(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Sydney_Sweeney_2019_by_Glenn_Francis.jpg/220px-Sydney_Sweeney_2019_by_Glenn_Francis.jpg',
              name: 'Sidney'),
          ActorItem(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Sydney_Sweeney_2019_by_Glenn_Francis.jpg/220px-Sydney_Sweeney_2019_by_Glenn_Francis.jpg',
              name: 'Sidney'),
          ActorItem(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Sydney_Sweeney_2019_by_Glenn_Francis.jpg/220px-Sydney_Sweeney_2019_by_Glenn_Francis.jpg',
              name: 'Sidney')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
              label: 'Booking'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.black),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          )
        ],
        backgroundColor: Colors.grey.shade500,
      ),
    );
  }
}
