import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_stats.model.g.dart';

@JsonSerializable(createToJson: false)
class PokemonStats {
  factory PokemonStats.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatsFromJson(json);

  const PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  @JsonKey(name: 'HP')
  final int hp;

  final int attack;

  final int defense;

  @JsonKey(name: 'special_attack')
  final int specialAttack;
  @JsonKey(name: 'special_defense')
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
