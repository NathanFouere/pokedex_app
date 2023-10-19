import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeFabWidget extends StatelessWidget {
  const HomeFabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SpeedDial(
        icon: Icons.tune,
        activeIcon: Icons.close,
        backgroundColor: const Color(0xFF6B79DB),
        foregroundColor: Colors.white,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.search),
            label: 'Rechercher',
            labelStyle: const TextStyle(fontSize: 18),
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.catching_pokemon),
            label: 'Toutes les générations',
            labelStyle: const TextStyle(fontSize: 18),
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.catching_pokemon),
            label: 'Tous les types',
            labelStyle: const TextStyle(fontSize: 18),
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.favorite_border),
            label: 'Favoris',
            labelStyle: const TextStyle(fontSize: 18),
          ),
        ],
      );
}