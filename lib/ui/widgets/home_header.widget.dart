import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/pokemon.png',
            ),
          ),
          const Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: FittedBox(
                child: Text(
                  'My Pokedex',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontFamily: 'Pokemon Solid',
                    fontWeight: FontWeight.bold,
                    wordSpacing: -5,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // TODO: implement
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      );
}
