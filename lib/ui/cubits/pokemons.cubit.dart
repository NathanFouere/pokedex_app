import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/data/api/pokemon.service.dart';
import 'package:pokedex_app/data/models/pokemon.model.dart';
import 'package:pokedex_app/ui/cubits/cubit.state.dart';
import 'package:pokedex_app/ui/cubits/pokemons.state.dart';

class PokemonsCubit extends Cubit<PokemonsState> {
  PokemonsCubit() : super(const InitialState<PokemonsStateData>());

  void getAll() async {
    try {
      emit(const LoadingState<PokemonsStateData>());
      final List<Pokemon> pokemons = await PokemonService.getAll();
      emit(
        SuccessState<PokemonsStateData>(
          data: PokemonsStateData(
            pokemons: pokemons,
          ),
        ),
      );
    } on Exception catch (exception) {
      emit(FailureState<PokemonsStateData>(message: exception.toString()));
    }
  }

  void like(Pokemon pokemon) {
    if (state is! SuccessState) return;
    final SuccessState<PokemonsStateData> pokemonsData =
        state as SuccessState<PokemonsStateData>;

    final List<Pokemon> likedPokemons = <Pokemon>[
      ...pokemonsData.data.likedPokemons,
    ];

    final int pokemonIndex = likedPokemons.indexWhere(
      (Pokemon currentPokemon) => currentPokemon.id == pokemon.id,
    );

    if (pokemonIndex == -1) {
      likedPokemons.add(pokemon);
    } else {
      likedPokemons.removeAt(pokemonIndex);
    }

    emit(
      SuccessState<PokemonsStateData>(
        data: PokemonsStateData(
          pokemons: pokemonsData.data.pokemons,
          likedPokemons: likedPokemons,
        ),
      ),
    );
  }
}
