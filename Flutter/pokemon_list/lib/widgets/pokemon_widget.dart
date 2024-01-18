import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_list/widgets/pokemon_item.dart';

import '../models/pokemon_response/pokemon_response.dart';

Future<PokemonResponse> fetchPokemon(String name) async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));
  if (response.statusCode == 200) {
    return PokemonResponse.fromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

class PokemonWidget extends StatefulWidget {
  const PokemonWidget({super.key, required this.pokemonName});
  final String pokemonName;
  @override
  State<PokemonWidget> createState() => PokemonWidgetState();
}

class PokemonWidgetState extends State<PokemonWidget> {
  late Future<PokemonResponse> pokemon;
  @override
  void initState() {
    super.initState();
    pokemon = fetchPokemon(widget.pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<PokemonResponse>(
        future: pokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PokemonItem(pokemon: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
