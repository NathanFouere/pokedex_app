import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/modals/pokemon_generations.drawer.dart';
import 'package:pokedex_app/ui/modals/pokemon_search.drawer.dart';
import 'package:pokedex_app/ui/modals/pokemon_types.drawer.dart';
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
        onAllTypesClicked: () => _allTypesDialog(context),
        onAllGenerationsClicked: () => _allGenerationsDialog(context),
        onSearchClicked: () => _searchDialog(context),
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
                itemBuilder: (context, index) => PokemonCardWidget(
                  pokemon: pokemons.elementAt(index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _allTypesDialog(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.65,
      ),
      context: context,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 1,
        expand: false,
        builder: (_, scrollController) => PokemonTypesDrawer(
          scrollController: scrollController,
        ),
      ),
    );
  }

  void _allGenerationsDialog(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.65,
      ),
      context: context,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 1,
        expand: false,
        builder: (_, scrollController) => PokemonGenerationsDrawer(
          scrollController: scrollController,
        ),
      ),
    );
  }

  void _searchDialog(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (_) => const PokemonSearchDrawer(),
    );
  }
}
