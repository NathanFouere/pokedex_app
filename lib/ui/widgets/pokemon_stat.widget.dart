import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_stats.model.dart';
import 'package:pokedex_app/ui/widgets/progress_bar.widget.dart';

class PokemonStatWidget extends StatelessWidget {
  const PokemonStatWidget({
    super.key,
    required this.color,
    required this.stat,
  });

  final Color color;
  final PokemonStat stat;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              stat.type.label,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              stat.value.toString().padLeft(3, '0'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: ProgressBarWidget(
              max: 100,
              current: stat.value.toDouble(),
              color: color,
            ),
          ),
        ],
      );
}
