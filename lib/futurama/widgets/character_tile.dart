import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futurama/futurama/constants.dart';
import 'package:futurama/futurama/models/character_model.dart';

import 'character_details/character_details.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterDetails(character: character))),
      child: Container(
        decoration: Constants.getBoxDecoration(),
        child: Wrap(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Constants.kGreyColor.withOpacity(0.8),
                      Constants.kGreenColor.withOpacity(0.6)
                    ],
                    begin: AlignmentDirectional.topStart,
                    //const FractionalOffset(1, 0),
                    end: AlignmentDirectional.bottomEnd,
                    stops: const [0.1, 0.9],
                    tileMode: TileMode.clamp),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              ),
              child: CachedNetworkImage(
                // fit: BoxFit.scalexDown,
                height: 80,
                imageUrl: character.images.main,

                placeholder: (context, url) => Image.asset(
                  'assets/images/loading.gif',
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    '${character.name.first} ' ' ${character.name.last}',
                    style: Theme.of(context).textTheme.bodyText2,
                    softWrap: false,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
