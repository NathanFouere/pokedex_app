import 'dart:math';

enum PokemonStatType {
  hp('PV'),
  attack('Attaque'),
  defense('Défense'),
  specialAttack('Atq. spé.'),
  specialDefense('Déf. spé.'),
  speed('Vitesse');

  const PokemonStatType(this.label);

  final String label;
}

class PokemonStat {
  final PokemonStatType type;
  final int value;

  const PokemonStat({
    required this.type,
    required this.value,
  });

  static PokemonStat mock(PokemonStatType type) => PokemonStat(
        type: type,
        value: Random().nextInt(100),
      );
}
