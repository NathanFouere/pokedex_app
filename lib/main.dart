import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/pages/home.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Pokedex App',
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        //home: PokemonDetailsPage(pokemon: Pokemon.mock()),
        home: const HomePage(),
      );
}
