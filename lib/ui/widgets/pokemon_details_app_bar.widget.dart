import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';

class PokemonDetailsAppBarWidget extends StatelessWidget {
  const PokemonDetailsAppBarWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => SliverAppBar(
        toolbarHeight: 45,
        leadingWidth: 80,
        leading: ElevatedButton(
          onPressed: () {
            // TODO: implement
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.black.withOpacity(0.25),
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: implement
            },
            icon: const Icon(
              Icons.favorite_border,
            ),
            iconSize: 33,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
        ],
        expandedHeight: 250,
        backgroundColor: pokemon.types.first.lightenColor,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.all(50),
            child: Image.network(
              pokemon.image,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
