import 'package:json_annotation/json_annotation.dart';

part 'pokemon_ref.model.g.dart';

@JsonSerializable(createToJson: false)
class PokemonRef {
  const PokemonRef({
    required this.name,
    required this.pokedexId,
  });

  factory PokemonRef.fromJson(Map<String, dynamic> json) =>
      _$PokemonRefFromJson(json);

  final String name;
  final int pokedexId;

  static PokemonRef mock([int index = 1]) => PokemonRef(
        name: 'Pokémon $index',
        pokedexId: index,
      );
}
