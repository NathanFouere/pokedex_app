import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

class PokemonTypeBubbleWidget extends StatelessWidget {
  const PokemonTypeBubbleWidget({
    super.key,
    required this.type,
    this.scale = 1,
  });

  final PokemonType type;
  final double scale;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: type.lightenColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        child: Text(
          type.name,
          style: const TextStyle(
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textScaleFactor: scale,
        ),
      );
}
