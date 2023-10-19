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
    required this.types,
    required this.generation,
    required this.evolutions,
  });

  final int id;
  final int pokedexId;
  final String name;
  final String image;
  final PokemonStats stats;
  final List<PokemonType> types;
  final int generation;
  final List<PokemonRef> evolutions;

  static List<Pokemon> mocks() => List<Pokemon>.generate(
        300,
        (int index) => mock(id: index + 1),
      );

  static Pokemon mock({
    int id = 1,
  }) =>
      Pokemon(
        id: id,
        pokedexId: id,
        name: 'Pokémon $id',
        image:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites'
            '/pokemon/other/official-artwork/1.png',
        stats: PokemonStats.mock(),
        types: List<PokemonType>.generate(
          Random().nextInt(2) + 1,
          (_) => PokemonType.mock(),
        ),
        generation: Random().nextInt(8) + 1,
        evolutions: <PokemonRef>[
          PokemonRef.mock(id + 1),
        ],
      );
}
