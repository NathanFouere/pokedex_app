import 'package:flutter/material.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    required this.max,
    required this.current,
    required this.color,
  });

  final double max;
  final double current;
  final Color color;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, BoxConstraints boxConstraints) {
          final double x = boxConstraints.maxWidth;
          final double percent = (current / max) * x;
          return Stack(
            children: [
              Container(
                width: x,
                height: 7,
                decoration: BoxDecoration(
                  color: const Color(0xffd3d3d3),
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: percent,
                height: 7,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ],
          );
        },
      );
}
