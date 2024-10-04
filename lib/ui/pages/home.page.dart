import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/widgets/pokemon_card.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_bubble.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex App'),
      ),
      body: GridView(

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
            childAspectRatio: 2
        ),
        children: const <Widget>[
          PokemonCard(),
          PokemonCard(),
          PokemonCard(),
          PokemonCard(),
          PokemonCard(),
          ],
      )
    );
  }
}
