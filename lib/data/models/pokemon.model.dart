import 'dart:math';

import 'package:pokedex_app/data/models/pokemon_ref.model.dart';
import 'package:pokedex_app/data/models/pokemon_stats.model.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

class Pokemon {
  const Pokemon({
    required this.id,
    required this.pokedexId,
    required this.name,
    required this.image,
    required this.stats,
    required this.apiTypes,
    required this.apiGeneration,
    required this.apiEvolutions,
    required this.apiPreEvolution,
  });

  final int id;
  final int pokedexId;
  final String name;
  final String image;
  final PokemonStats stats;
  final List<PokemonType> apiTypes;
  final int apiGeneration;
  final List<PokemonRef> apiEvolutions;
  final PokemonRef? apiPreEvolution;

  static List<Pokemon> mocks() => List.generate(
        300,
        (index) => mock(index +1),
      );

  static Pokemon mock([int index = 1]) => Pokemon(
        id: index,
        pokedexId: index,
        name: 'Pokémon $index',
        image:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites'
            '/pokemon/other/official-artwork/1.png',
        stats: PokemonStats.mock(),
        apiTypes: List.generate(
          Random().nextInt(2) + 1,
          (index) => PokemonType.mock(),
        ),
        apiGeneration: 9,
        apiEvolutions: <PokemonRef>[
          PokemonRef.mock(),
        ],
        apiPreEvolution: null,
      );
}
