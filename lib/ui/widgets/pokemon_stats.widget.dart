import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_stats.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_stat.widget.dart';

class PokemonStatsWidget extends StatelessWidget {
  const PokemonStatsWidget({
    super.key,
    required this.color,
    required this.stats,
  });

  final Color color;
  final PokemonStats stats;

  @override
  Widget build(BuildContext context) => ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 15),
        shrinkWrap: true,
        children: [
          PokemonStatWidget(
            color: color,
            label: 'PV',
            value: stats.hp,
          ),
          const SizedBox(height: 10),
          PokemonStatWidget(
            color: color,
            label: 'Attaque',
            value: stats.attack,
          ),
          const SizedBox(height: 10),
          PokemonStatWidget(
            color: color,
            label: 'Défense',
            value: stats.defense,
          ),
          const SizedBox(height: 10),
          PokemonStatWidget(
            color: color,
            label: 'Atq. spé',
            value: stats.specialAttack,
          ),
          const SizedBox(height: 10),
          PokemonStatWidget(
            color: color,
            label: 'Déf. spé',
            value: stats.specialDefense,
          ),
          const SizedBox(height: 10),
          PokemonStatWidget(
            color: color,
            label: 'Vitesse',
            value: stats.speed,
          ),
        ],
      );
}
