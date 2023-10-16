import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

class PokemonTypeBubbleWidget extends StatelessWidget {
  const PokemonTypeBubbleWidget({
    super.key,
    required this.type,
  });

  final PokemonType type;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Text(
          type.name,
          style: const TextStyle(
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
}
