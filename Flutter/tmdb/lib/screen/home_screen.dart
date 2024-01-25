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

/*
class BounceNavigationBar extends StatefulWidget {

  @override
  State<BounceNavigationBar> createState() => BounceNavigationBarState();
}

class BounceNavigationBarState extends State<BounceNavigationBar> with SingleTickerProviderStateMixin{
  
 
  late AnimationController _controller;
  late Animation _animTabBarIn;
  late Animation _animTabBarOut;
  
  @override
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this,
    duration: const Duration(
      milliseconds: 1200,
    ));
    _animTabBarIn = CurveTween(curve: const Interval(0.1, 0.6, curve: Curves.decelerate)).animate(_controller);
    _animTabBarOut = CurveTween(curve: const Interval(0.6, 1.0, curve: Curves.decelerate)).animate(_controller);
  }

  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, snapshot){
        return BottomNavigationBar(
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
        );
      },
      child: BottomNavigationBar(
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
}*/
