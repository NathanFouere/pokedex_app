import 'dart:convert';

import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon_type.model.dart';

class PokemonTypesService {
  Future<List<PokemonType>> getAll() async {
    final  res = await http.get(Uri.parse('https://pokebuildapi.fr/api/v1/types'));
    final t = jsonDecode(res.body) as List<dynamic>;
    final  List<PokemonType> pokemons = [];
    t.forEach((x) {
      pokemons.add(PokemonType.fromJson(x as Map<String, dynamic>));
    });
    return pokemons;
  }
}