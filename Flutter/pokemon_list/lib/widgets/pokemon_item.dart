import 'package:flutter/material.dart';
import 'package:pokemon_list/models/pokemon_response/pokemon_response.dart';

BoxDecoration getGradienFromType(String type) {
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;

  switch (type) {
    case 'fighting':
      color1 = Colors.red;
      color2 = Colors.red.shade100;
      break;
    case 'psychic':
      color1 = Colors.pink.shade900;
      color2 = Colors.pink.shade700;
      break;
    case 'normal':
      color1 = Colors.grey;
      color2 = Colors.grey.shade100;
      break;
    case 'flying':
      color1 = Colors.lightBlue.shade300;
      color2 = Colors.lightBlue.shade100;
      break;
    case 'poison':
      color1 = Colors.deepPurple;
      color2 = Colors.deepPurple.shade200;
      break;
    case 'ground':
      color1 = Colors.brown;
      color2 = Colors.brown.shade200;
      break;
    case 'rock':
      color1 = Colors.grey.shade700;
      color2 = Colors.grey;
      break;
    case 'bug':
      color1 = Colors.lightGreen;
      color2 = Colors.lightGreen.shade100;
      break;
    case 'ghost':
      color1 = Colors.indigo.shade900;
      color2 = Colors.indigo.shade700;
      break;
    case 'steel':
      color1 = Colors.grey;
      color2 = Colors.grey.shade100;
      break;
    case 'fire':
      color1 = Colors.orange;
      color2 = Colors.orange.shade100;
      break;
    case 'dragon':
      color1 = Colors.blue.shade900;
      color2 = Colors.blue.shade700;
      break;
    case 'ice':
      color1 = Colors.lightBlue;
      color2 = Colors.lightBlue.shade100;
      break;
    case 'electric':
      color1 = Colors.yellow;
      color2 = Colors.yellow.shade100;
      break;
    case 'grass':
      color1 = Colors.green;
      color2 = Colors.green.shade100;
      break;
    case 'water':
      color1 = Colors.blue;
      color2 = Colors.blue.shade100;
      break;
    case 'dark':
      color1 = Colors.black;
      color2 = Colors.grey.shade800;
      break;
  }

  return BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      color1,
      color2,
    ],
  ));
}

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key, required this.pokemon});
  final PokemonResponse pokemon;
  @override
  Widget build(BuildContext context) {
    String typeName = pokemon.types![0].type!.name!;
    String fullTypes = '';
    pokemon.types?.forEach((e) => fullTypes += ' ${e.type!.name!} |');
    return Center(
      child: SizedBox(
        height: 400,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(10),
          child: Container(
            decoration: getGradienFromType(typeName),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fullTypes,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 20, 46, 21),
                        ),
                      ),
                      Text(
                        '${pokemon.id}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image(
                      image: NetworkImage('${pokemon.sprites?.frontDefault!}'),
                      fit: BoxFit.contain,
                      width: 200,
                    )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${pokemon.name?.toUpperCase()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '${pokemon.baseExperience} ~ bExp',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.gamepad_rounded),
                          Text(
                              ' ${pokemon.gameIndices?.first.version?.name!.toUpperCase()}'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.monitor_weight_rounded),
                          Text(' ${pokemon.weight}Kg'),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.height),
                          Text(' ${pokemon.height}cm'),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
