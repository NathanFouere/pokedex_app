class PokemonRef {
  const PokemonRef({
    required this.name,
    required this.pokedexId,
  });

  final String name;
  final int pokedexId;

  static PokemonRef mock([int index = 1]) => PokemonRef(
        name: 'Pokémon $index',
        pokedexId: index,
      );
}
