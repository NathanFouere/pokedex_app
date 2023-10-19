import 'package:flutter/material.dart';
import 'package:pokedex_app/data/models/pokemon_type.model.dart';
import 'package:pokedex_app/ui/widgets/pokemon_type_card.widget.dart';

class PokemonTypesDrawer extends StatelessWidget {
  const PokemonTypesDrawer({
    super.key,
    required this.types,
    this.scrollController,
  });

  final List<PokemonType> types;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 5,
            width: 60,
          ),
          Flexible(
            child: GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.6,
              ),
              itemCount: types.length,
              itemBuilder: (BuildContext context, int index) {
                final PokemonType type = types.elementAt(index);
                return InkWell(
                  onTap: () => Navigator.of(context).pop(type),
                  child: PokemonTypeCardWidget(
                    type: type,
                  ),
                );
              },
            ),
          ),
        ],
      );
}
