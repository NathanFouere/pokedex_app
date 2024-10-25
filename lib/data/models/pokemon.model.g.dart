// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: (json['id'] as num).toInt(),
      pokedexId: (json['pokedexId'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      stats: PokemonStats.fromJson(json['stats'] as Map<String, dynamic>),
      types: (json['apiTypes'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      generation: (json['apiGeneration'] as num).toInt(),
      evolutions: (json['apiEvolutions'] as List<dynamic>)
          .map((e) => PokemonRef.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
