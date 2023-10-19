import 'package:flutter/material.dart';

class PokemonIdWidget extends StatelessWidget {
  const PokemonIdWidget({
    super.key,
    required this.id,
    this.style,
  });

  final int id;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => Text(
        '#${id.toString().padLeft(3, '0')}',
        style: style,
      );
}
