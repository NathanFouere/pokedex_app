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

  static Pokemon mock() => Pokemon(
        id: 999,
        pokedexId: 999,
        name: 'Pokémock',
        image: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
        stats: PokemonStats.mock(),
        apiTypes: <PokemonType>[
          PokemonType.mock(),
        ],
        apiGeneration: 9,
        apiEvolutions: <PokemonRef>[
          PokemonRef.mock(),
        ],
        apiPreEvolution: null,
      );
}
