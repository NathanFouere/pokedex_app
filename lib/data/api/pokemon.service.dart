import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/models/pokemon.model.dart';

abstract class PokemonService {
  static const String _baseUrl = 'https://pokebuildapi.fr/api/v1';

  static Future<List<Pokemon>> getAll() async {
    final http.Response response = await http.get(
      Uri.parse('$_baseUrl/pokemon'),
    );

    if (response.statusCode != 200) {
      throw Exception('Pokemon list not available');
    }

    try {
      final List<dynamic> list = json.decode(response.body);
      return list.map((model) => Pokemon.fromJson(model)).toList();
    } catch (e) {
      throw Exception('Pokemon list not available');
    }
  }
}
