import 'package:json_annotation/json_annotation.dart';

part 'pokemon_resistance.model.g.dart';

@JsonSerializable(createToJson: false)
class PokemonResistance {
  const PokemonResistance({
    required this.name,
    required this.damageMultiplier,
    required this.damageRelation,
  });

  factory PokemonResistance.fromJson(Map<String, dynamic> json) => _$PokemonResistanceFromJson(json);

  final String name;
  @JsonKey(name: 'damage_multiplier')
  final double damageMultiplier;
  @JsonKey(name: 'damage_relation')
  final String damageRelation;
}
