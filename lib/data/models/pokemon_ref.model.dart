class PokemonRef {
  const PokemonRef({
    required this.name,
    required this.pokedexId,
  });

  final String name;
  final int pokedexId;

  static PokemonRef mock() => const PokemonRef(
        name: 'Pokévolution',
        pokedexId: 1000,
      );
}
