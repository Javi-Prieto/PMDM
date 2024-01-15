import 'package:basketball_game/widget/team_item.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          "THE GAME",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _dark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: _dark ? Colors.black : Colors.white,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TeamItem(teamName: 'Local', isBlack: _dark),
          TeamItem(
            teamName: 'Visitante',
            isBlack: _dark,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _dark ? _dark = false : _dark = true;
              });
            },
            child: _dark
                ? Icon(
                    Icons.sunny,
                    color: Colors.amber.shade600,
                  )
                : const Icon(
                    Icons.brightness_3,
                    color: Colors.black,
                  ),
          )
        ],
      )),
    );
  }
}
