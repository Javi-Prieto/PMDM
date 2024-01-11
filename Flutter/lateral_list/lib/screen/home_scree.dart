import 'package:flutter/material.dart';
import 'package:lateral_list/widget/actor_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ActorItem(imageUrl: 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/wrPmsC9YATcnyAxvXEdGshccbqU.jpg', name: 'Sidney'),
          ActorItem(imageUrl: 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/wrPmsC9YATcnyAxvXEdGshccbqU.jpg', name: 'Sidney'),
          ActorItem(imageUrl: 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/wrPmsC9YATcnyAxvXEdGshccbqU.jpg', name: 'Sidney'),
          ActorItem(imageUrl: 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/wrPmsC9YATcnyAxvXEdGshccbqU.jpg', name: 'Sidney')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt, color: Colors.black,),
            label: 'Booking'
          ),
            
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