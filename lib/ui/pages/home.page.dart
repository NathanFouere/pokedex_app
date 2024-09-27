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
        onAllTypesClicked: () => _allTypesDialog(context, pokemons: pokemons),
        onAllGenerationsClicked: () =>
            _allGenerationsDialog(context, pokemons: pokemons),
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
                  childAspectRatio: 1.5,
                ),
                itemCount: pokemons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Pokemon pokemon = pokemons.elementAt(index);
                  return PokemonCardWidget(
                    pokemon: pokemon,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => PokemonDetailsPage(pokemon: pokemon),
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

  void _allTypesDialog(
    BuildContext context, {
    required List<Pokemon> pokemons,
  }) async {
    final Map<String, PokemonType> typesByName = {};

    pokemons.expand((Pokemon pokemon) => pokemon.types).forEach(
          (PokemonType type) => typesByName.putIfAbsent(type.name, () => type),
        );

    final PokemonType? type = await showModalBottomSheet<PokemonType>(
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.65,
      ),
      context: context,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 1,
        expand: false,
        builder: (_, ScrollController scrollController) => PokemonTypesDrawer(
          types: typesByName.values.toList(),
          scrollController: scrollController,
        ),
      ),
    );

    if (type == null) return;

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'Vous avez choisi les Pokémons de '
            'type ${type.name}...',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.lightGreen,
        ),
      );
  }

  void _allGenerationsDialog(
    BuildContext context, {
    required List<Pokemon> pokemons,
  }) async {
    final int? generation = await showModalBottomSheet<int>(
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.65,
      ),
      context: context,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 1,
        expand: false,
        builder: (_, ScrollController scrollController) =>
            PokemonGenerationsDrawer(
          pokemons: pokemons,
          scrollController: scrollController,
        ),
      ),
    );

    if (generation == null) return;

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'Vous avez choisi les Pokémons de '
            'genération ${generation.toRoman()}...',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.lightGreen,
        ),
      );
  }

  void _searchDialog(BuildContext context) async {
    final String? search = await showModalBottomSheet<String>(
      context: context,
      builder: (_) => const PokemonSearchDrawer(),
    );

    if (search == null) return;

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'Vous avez choisi tapé la recherche '
            'suivante : $search...',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.lightGreen,
        ),
      );
  }
}
