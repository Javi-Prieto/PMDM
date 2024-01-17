import 'package:first_http_petition/widget/pokemon_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeManiacos'),
        centerTitle: true,
      ),
      body: const PokemonWidget(),
    );
  }
}
