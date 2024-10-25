import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/data/api/pokemon.service.dart';
import 'package:pokedex_app/ui/pages/pokemon_details.page.dart';
import 'package:pokedex_app/ui/widgets/home_header.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_card.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    super.initState();
    this.getPokemons();
  }

  Future<void> getPokemons() async {
    setState(() {
      isLoading = true;
    });

    List<Pokemon> listOfPokemons = await PokemonService().getAll();

    setState(() {
      pokemons = listOfPokemons;
      isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    final Future <List<Pokemon>> futurePok = PokemonService().getAll();
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
              child:
                isLoading ?
                  const Center(
                    child: CircularProgressIndicator(),
                  ) :
              GridView.builder(
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
}
