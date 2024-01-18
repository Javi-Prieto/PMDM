import 'package:flutter/material.dart';
import 'package:pokemon_list/models/pokemon_list/result.dart';
import 'package:pokemon_list/widgets/pokemon_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.pokemonList});
  final List<Result> pokemonList;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
        centerTitle: true,
      ),
      body: Skeletonizer(
        enabled: widget.pokemonList.isEmpty,
        child: ListView.builder(
            itemCount: widget.pokemonList.length,
            itemBuilder: (context, index) {
              return PokemonWidget(
                  pokemonName: widget.pokemonList[index].name!);
            }),
      ),
    );
  }
}
