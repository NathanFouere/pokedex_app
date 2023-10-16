import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_bubble.widget.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: pokemon.apiTypes.first.color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Spacer(),
                Text(
                  '#${pokemon.pokedexId.toString().padLeft(3, '0')}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 5,
                    child: ListView.separated(
                      itemBuilder: (_, index) => PokemonTypeBubbleWidget(
                        type: pokemon.apiTypes.elementAt(index),
                      ),
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemCount: pokemon.apiTypes.length,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    flex: 4,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Image.network(
                          pokemon.image,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
