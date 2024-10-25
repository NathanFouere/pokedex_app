import 'dart:convert';

import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:http/http.dart' as http;

class PokemonService {
  Future<List<Pokemon>> getAll() async {
    final  res = await http.get(Uri.parse('https://pokebuildapi.fr/api/v1/pokemon'));
    final t = jsonDecode(res.body) as List<dynamic>;
    final  List<Pokemon> pokemons = [];
    t.forEach((x) {
      pokemons.add(Pokemon.fromJson(x as Map<String, dynamic>));
    });
    return pokemons;
  }
}