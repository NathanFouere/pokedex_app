import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_bubble.widget.dart';

class PokemonTypesDialog extends StatelessWidget {
  const PokemonTypesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PokemonType> pokemonTypes = PokemonType.mocks();
    return GridView.builder(
      itemBuilder: (BuildContext contxext, int idx) {
        final PokemonType type = pokemonTypes.elementAt(idx);
        return PokemonTypeBubbleWidget(type: type);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
    );
  }
}
