import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/utils/color.extension.dart';

class PokemonType {
  const PokemonType({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  static PokemonType mock() {
    final List<String> types = [
      'Eau',
      'Feu',
      'Glace',
      'Plante',
      'Roche',
      'Spectre',
    ];
    final String name = types.elementAt(Random().nextInt(types.length));
    return PokemonType(
      name: name,
      image: 'https://static.wikia.nocookie.net/pokemongo'
          '/images/0/05/Poison.png',
    );
  }

  static List<PokemonType> mocks() => List<PokemonType>.generate(
    10,
      (_) => mock(),
  );

  Color get color {
    switch (name) {
      case 'Normal':
        return const Color(0xFFA7A877);
      case 'Feu':
        return const Color(0xFFFB6C6C);
      case 'Eau':
        return const Color(0xFF77BDFE);
      case 'Plante':
        return const Color(0xFF48D0B0);
      case 'Électrik':
        return const Color(0xFFFFCE4B);
      case 'Glace':
        return const Color(0xFF99D7D8);
      case 'Combat':
        return const Color(0xFFC03128);
      case 'Poison':
        return const Color(0xFF9F419F);
      case 'Sol':
        return const Color(0xFFE1C068);
      case 'Vol':
        return const Color(0xFFA890F0);
      case 'Psy':
        return const Color(0xFFF95887);
      case 'Insecte':
        return const Color(0xFFA8B91F);
      case 'Roche':
        return const Color(0xFFB8A038);
      case 'Spectre':
        return const Color(0xFF705998);
      case 'Ténèbres':
        return const Color(0xFF6F5848);
      case 'Dragon':
        return const Color(0xFF7138F8);
      case 'Acier':
        return const Color(0xFFB8B8D0);
      case 'Fée':
        return const Color(0xFFA890F0);
      default:
        return Colors.grey;
    }
  }

  Color get lightenColor => color.lighten();
}
