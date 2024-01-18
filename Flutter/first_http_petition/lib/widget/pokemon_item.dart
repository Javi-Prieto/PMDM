import 'package:first_http_petition/models/pokemon_response/pokemon_response.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});
  final PokemonResponse pokemon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${pokemon.types!.first.type?.name?.toUpperCase()}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    Text(
                      '${pokemon.id}',
                      style: const TextStyle(color: Colors.grey),
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
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
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
    );
  }
}
