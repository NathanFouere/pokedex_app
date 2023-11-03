import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_id.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_bubble.widget.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({
    super.key,
    required this.pokemon,
    this.onTap,
  });

  final Pokemon pokemon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Container(
          decoration: BoxDecoration(
            color: pokemon.types.first.color,
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
                  PokemonIdWidget(
                    id: pokemon.pokedexId,
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
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, int index) => PokemonTypeBubbleWidget(
                          type: pokemon.types.elementAt(index),
                        ),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemCount: pokemon.types.length,
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
        ),
  );
}
