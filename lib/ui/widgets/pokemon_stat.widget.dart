import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/widgets/progress_bar.widget.dart';

class PokemonStatWidget extends StatelessWidget {
  const PokemonStatWidget({
    super.key,
    required this.color,
    required this.label,
    required this.value,
  });

  final Color color;
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              label,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value.toString().padLeft(3, '0'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: ProgressBarWidget(
              max: 100,
              current: value.toDouble(),
              color: color,
            ),
          ),
        ],
      );
}
