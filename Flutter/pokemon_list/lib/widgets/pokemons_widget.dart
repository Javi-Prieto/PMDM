import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_list/models/pokemon_list/pokemon_list.dart';
import 'package:pokemon_list/screen/home_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({super.key});

  @override
  State<PokemonListWidget> createState() => PokemonListWidgetState();
}

class PokemonListWidgetState extends State<PokemonListWidget> {
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
          return const Skeletonizer(
          enabled: true,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'hola',
                      style: TextStyle(
                        color: Color.fromARGB(255, 20, 46, 21),
                      ),
                    ),
                    Text(
                      'a',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: NetworkImage('a'),
                    fit: BoxFit.contain,
                    width: 200,
                  )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'a',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'a ~ bExp',
                      style:
                          TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Icon(Icons.gamepad_rounded),
                        Text(
                            ' a'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.monitor_weight_rounded),
                        Text('Kg'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.height),
                        Text(' cm'),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
                    );
        }
      ),
    );
  }
}

