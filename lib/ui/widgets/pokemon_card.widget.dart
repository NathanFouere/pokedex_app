import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/pages/pokemon_details.page.dart';
import 'package:pokedex_app/ui/widgets/pokemon_id.widget.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_bubble.widget.dart';

class PokemonCardWidget extends StatelessWidget {
  const PokemonCardWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      // recupère contexte parent pour afficher le snackbar -> snackbar a un espace reservé sur chaque scaffold
      //  ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
           //        content: Text(pokemon.name),
      //       duration: const Duration(seconds: 1),
      //        backgroundColor: pokemon.types.first.color,
      //      )
      //   );
      Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) =>
              PokemonDetailsPage(pokemon: pokemon)
          ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: pokemon.types.first.color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                pokemon.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const Spacer(),
              PokemonIdWidget(
                id: pokemon.pokedexId,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 5,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) => PokemonTypeBubbleWidget(
                      type: pokemon.types.elementAt(index),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(height: 5),
                    itemCount: pokemon.types.length,
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  flex: 4,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Image.network(
                        pokemon.image,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
