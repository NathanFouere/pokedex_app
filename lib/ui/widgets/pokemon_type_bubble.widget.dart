import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonTypeBubble extends StatelessWidget {
  final String type;
  const PokemonTypeBubble({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 75,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.amber,
      child: Text(
        this.type,
      ),
    );
  }
}
