import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/cubits/cubit.state.dart';

typedef PokemonsState = CubitState<PokemonsStateData>;

class PokemonsStateData {
  const PokemonsStateData({
    required this.pokemons,
    this.likedPokemons = const <Pokemon>[],
  });

  final List<Pokemon> pokemons;
  final List<Pokemon> likedPokemons;
}
