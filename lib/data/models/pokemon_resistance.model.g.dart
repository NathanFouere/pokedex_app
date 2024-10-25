// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_resistance.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResistance _$PokemonResistanceFromJson(Map<String, dynamic> json) =>
    PokemonResistance(
      name: json['name'] as String,
      damageMultiplier: (json['damage_multiplier'] as num).toDouble(),
      damageRelation: json['damage_relation'] as String,
    );
