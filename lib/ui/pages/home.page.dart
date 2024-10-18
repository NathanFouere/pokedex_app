import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/widgets/home_header.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_card.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_types.dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> pokemons = Pokemon.mocks();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: HomeHeaderWidget(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ) +
                    EdgeInsets.only(
                      bottom: MediaQuery.paddingOf(context).bottom,
                    ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: pokemons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Pokemon pokemon = pokemons.elementAt(index);
                  return PokemonCardWidget(
                    pokemon: pokemon,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.heart_broken_outlined),
            label: 'Favoris',
            onTap: () => print('Fav'),
          ),
           SpeedDialChild(
            child: const Icon(Icons.catching_pokemon_outlined),
            label: 'Tous les types',
            onTap: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context)=> const PokemonTypesDialog(),
            ),
          ),
           SpeedDialChild(
            child: const Icon(Icons.catching_pokemon_outlined),
            label: 'Toutes les générations',
            onTap: () => print('toutes les gene'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.search),
            label: 'Rechercher',
            onTap: () => print('je recherche'),
          ),
        ],
      )
    );
  }
}
