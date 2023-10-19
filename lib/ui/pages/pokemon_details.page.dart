import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_details_app_bar.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_evolution.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_id.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_stat.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_bubble.widget.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            PokemonDetailsAppBarWidget(
              pokemon: pokemon,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            pokemon.name,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        const SizedBox(width: 10),
                        PokemonIdWidget(
                          id: pokemon.pokedexId,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: pokemon.apiTypes
                          .map(
                            (type) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: PokemonTypeBubbleWidget(
                                type: type,
                                scale: 1.3,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Statistiques',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => PokemonStatWidget(
                        color: pokemon.apiTypes.first.color,
                        stat: pokemon.stats.elementAt(index),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: pokemon.stats.length,
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Évolution',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => PokemonEvolutionWidget(
                        evolution: pokemon.apiEvolutions.elementAt(index),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: pokemon.apiEvolutions.length,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}