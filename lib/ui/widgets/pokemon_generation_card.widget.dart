import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/utils/int.extension.dart';
import 'package:pokedex_app/ui/widgets/custom_card.widget.dart';

class PokemonGenerationCardWidget extends StatelessWidget {
  const PokemonGenerationCardWidget({
    super.key,
    required this.generation,
    required this.starterPokemons,
  });

  final int generation;
  final List<Pokemon> starterPokemons;

  @override
  Widget build(BuildContext context) => CustomCardWidget(
        backgroundColor: Colors.white30,
        children: [
          Text(
            'Génération ${generation.toRoman()}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              children: starterPokemons
                  .map(
                    (starterPokemon) => Flexible(
                      child: Image.network(
                        starterPokemon.image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
}
