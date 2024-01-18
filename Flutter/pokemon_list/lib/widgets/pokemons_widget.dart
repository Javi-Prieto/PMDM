
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_list/models/pokemon_list/pokemon_list.dart';
import 'package:pokemon_list/screen/home_screen.dart';
Future<PokemonList> fetchPokemon() async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));
  if (response.statusCode == 200) {
    final toReturn = PokemonList.fromJson(response.body);
    return toReturn;
  } else {
    throw Exception('Failed to load album');
  }
}

class PokemonWidget extends StatefulWidget {
  const PokemonWidget({super.key});

  @override
  State<PokemonWidget> createState() => PokemonWidgetState();
}

class PokemonWidgetState extends State<PokemonWidget> {
  late Future<PokemonList> pokemonList;
  @override
  void initState() {
    super.initState();
    pokemonList = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<PokemonList>(
        future: pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen(pokemonList: snapshot.data!.results!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
