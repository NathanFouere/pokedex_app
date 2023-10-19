import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';
import 'package:pokedex_app/ui/modals/pokemon_generations.drawer.dart';
import 'package:pokedex_app/ui/modals/pokemon_search.drawer.dart';
import 'package:pokedex_app/ui/modals/pokemon_types.drawer.dart';
import 'package:pokedex_app/ui/pages/pokemon_details.page.dart';
import 'package:pokedex_app/ui/utils/int.extension.dart';
import 'package:pokedex_app/ui/widgets/home_fab.widget.dart';
import 'package:pokedex_app/ui/widgets/home_header.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_card.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Pokemon> pokemons = Pokemon.mocks();
    return Scaffold(
      floatingActionButton: HomeFabWidget(
        onAllTypesClicked: () => print('Types clicked'),
        onAllGenerationsClicked: () => print('Generations clicked'),
        onSearchClicked: () => print('Search clicked'),
      ),
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
                  childAspectRatio: 1.6,
                ),
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemons.elementAt(index);
                  return PokemonCardWidget(
                    pokemon: pokemon,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailsPage(pokemon: pokemon),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
