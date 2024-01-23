import 'package:flutter/material.dart';
import 'package:tmdb/screen/movie_screen.dart';
import 'package:tmdb/screen/people_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    PeopleScreen(),
    MovieScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TMDB"),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Actor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}


class BounceNavigationBar extends StatefulWidget {
  const BounceNavigationBar({super.key});

  @override
  State<BounceNavigationBar> createState() => BounceNavigationBarState();
}

class BounceNavigationBarState extends State<BounceNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
