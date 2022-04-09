import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../providers/character_service.dart';
import 'character_tile.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    final characterList = Provider.of<CharacterServices>(context);
    return FutureBuilder(
        future: Provider.of<CharacterServices>(context).getCharacters(),
        builder: (context, snapshot) {
          if (characterList.characters.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return StaggeredGridView.countBuilder(
              primary: true,
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemCount: characterList.characters.length,
              itemBuilder: (BuildContext context, int index) {
                var _character = characterList.characters.elementAt(index);

                return CharacterTile(character: _character);
              },
              staggeredTileBuilder: (int index) => StaggeredTile.fit(
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 4),
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
            );
          }
        });
  }
}
