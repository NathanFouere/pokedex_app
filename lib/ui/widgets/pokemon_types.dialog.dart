import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';
import 'package:pokedex_app/ui/data/api/pokemon_types.service.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_bubble.widget.dart';

typedef PokemonTypeTapCallbackTwo = void Function(PokemonType val);

class PokemonTypesDialog extends StatefulWidget {

  const PokemonTypesDialog({super.key, required this.onCall});
  final PokemonTypeTapCallbackTwo onCall;

  @override
  State<PokemonTypesDialog> createState() => _PokemonTypesDialogState();
}

class _PokemonTypesDialogState extends State<PokemonTypesDialog> {
  bool isLoading = false;
  List<PokemonType> pokemonTypes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getPokemonsTypes();
  }

  Future<void> getPokemonsTypes() async {
    setState(() {
      isLoading = true;
    });

    List<PokemonType> listOfPokemons = await PokemonTypesService().getAll();

    setState(() {
      pokemonTypes = listOfPokemons;
      isLoading = false;
    });
  }
  
  void onPokemonTypeTap(PokemonType type) {
    print("OEOEOE");
    print(type.name);
    widget.onCall(type);
  }

  @override
  Widget build(BuildContext context) => GridView.builder(
    itemCount: pokemonTypes.length,
      itemBuilder: (BuildContext contxext, int idx) {
        final PokemonType type = pokemonTypes.elementAt(idx);
        return PokemonTypeBubbleWidget(type: type, onTap: (PokemonType val) { this.onPokemonTypeTap(type); },);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
    );
}