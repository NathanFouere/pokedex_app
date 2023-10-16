class PokemonStats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  const PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  static PokemonStats mock() => const PokemonStats(
        hp: 10,
        attack: 20,
        defense: 30,
        specialAttack: 40,
        specialDefense: 50,
        speed: 60,
      );
}
