import 'dart:math';

class PokemonStats {
  const PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  static PokemonStats mock() => PokemonStats(
        hp: _randomInt(),
        attack: _randomInt(),
        defense: _randomInt(),
        specialAttack: _randomInt(),
        specialDefense: _randomInt(),
        speed: _randomInt(),
      );

  static int _randomInt() => Random().nextInt(100) + 1;
}
