import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

typedef PokemonTypeTapCallback = void Function(PokemonType val);

class PokemonTypeBubbleWidget extends StatelessWidget {
  const PokemonTypeBubbleWidget({
    super.key,
    required this.type,
    this.scale = 1, required this.onTap,
  });

  final PokemonType type;
  final double scale;
  final PokemonTypeTapCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => onTap(type),
    child: Container(
        decoration: BoxDecoration(
          color: type.lightenColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        child: Column(
          children: [
            Text(
              type.name,
              style: const TextStyle(
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textScaleFactor: scale,
            ),
            Image.network(type.image, scale: 0.2,)
          ],
        )
    )
  );
}
