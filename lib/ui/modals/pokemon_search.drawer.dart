import 'package:flutter/material.dart';

class PokemonSearchDrawer extends StatelessWidget {
  const PokemonSearchDrawer({
    super.key,
  });

  OutlineInputBorder _inputBorder([Color? color]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color ?? Colors.grey.withOpacity(0.4),
        ),
      );

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Tapez pour rechercher',
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                    border: _inputBorder(),
                    enabledBorder: _inputBorder(),
                    focusedBorder:
                        _inputBorder(Colors.lightBlue.withOpacity(0.7)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  // TODO: implement
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      );
}
