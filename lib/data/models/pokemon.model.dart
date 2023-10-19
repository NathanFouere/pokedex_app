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
  final List<PokemonStat> stats;
  final List<PokemonType> apiTypes;
  final int apiGeneration;
  final List<PokemonRef> apiEvolutions;
  final PokemonRef? apiPreEvolution;

  static List<Pokemon> mocks() => List.generate(
        300,
        (index) => mock(id: index + 1),
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
        stats: [
          PokemonStat.mock(PokemonStatType.hp),
          PokemonStat.mock(PokemonStatType.attack),
          PokemonStat.mock(PokemonStatType.defense),
          PokemonStat.mock(PokemonStatType.specialAttack),
          PokemonStat.mock(PokemonStatType.specialDefense),
          PokemonStat.mock(PokemonStatType.speed),
        ],
        apiTypes: List.generate(
          Random().nextInt(2) + 1,
          (index) => PokemonType.mock(),
        ),
        apiGeneration: Random().nextInt(8) + 1,
        apiEvolutions: <PokemonRef>[
          PokemonRef.mock(id + 1),
        ],
        apiPreEvolution: null,
      );
}
