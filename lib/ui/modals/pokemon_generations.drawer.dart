import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_generation_card.widget.dart';

class PokemonGenerationsDrawer extends StatelessWidget {
  const PokemonGenerationsDrawer({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> pokemons = Pokemon.mocks();

    final Map<int, List<Pokemon>> generations = pokemons
        .sorted((a, b) => a.apiGeneration.compareTo(b.apiGeneration))
        .groupListsBy(
          (element) => element.apiGeneration,
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 5,
          width: 60,
        ),
        Flexible(
          child: GridView.builder(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.6,
            ),
            itemCount: generations.length,
            itemBuilder: (context, index) {
              final MapEntry<int, List<Pokemon>> generation =
                  generations.entries.elementAt(index);
              return InkWell(
                onTap: () => print('Génération choisie = ${generation.key}'),
                child: PokemonGenerationCardWidget(
                  generation: generation.key,
                  starterPokemons: generation.value.take(3).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
