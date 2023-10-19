import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';
import 'package:pokedex_app/ui/widgets/custom_card.widget.dart';

class PokemonTypeCardWidget extends StatelessWidget {
  const PokemonTypeCardWidget({
    super.key,
    required this.type,
  });

  final PokemonType type;

  @override
  Widget build(BuildContext context) => CustomCardWidget(
        backgroundColor: type.color,
        children: [
          Text(
            type.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Image.network(type.image),
          ),
        ],
      );
}
