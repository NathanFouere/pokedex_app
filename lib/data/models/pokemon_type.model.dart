class PokemonType {
  const PokemonType({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  static PokemonType mock() => const PokemonType(
        name: 'Pokétype',
        image:
            'https://static.wikia.nocookie.net/pokemongo/images/0/05/Poison.png',
      );
}
