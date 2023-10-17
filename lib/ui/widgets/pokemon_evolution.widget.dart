import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_ref.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_id.widget.dart';

class PokemonEvolutionWidget extends StatelessWidget {
  const PokemonEvolutionWidget({
    super.key,
    required this.evolution,
  });

  final PokemonRef evolution;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(
            evolution.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 20),
          PokemonIdWidget(
            id: evolution.pokedexId,
          ),
        ],
      );
}
