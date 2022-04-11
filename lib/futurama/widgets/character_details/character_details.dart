import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/character_model.dart';
import 'components/backdrop_rating.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;
  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackDropAndRating(size: size, character: character),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I am ${character.name.first} ${character.name.middle} ${character.name.last}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "My Home Planet is ${character.homePlanet}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      maxLines: 2,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "My Occupation is ${character.occupation}",
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Below are my sayings:',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  // vertical: 10,
                  horizontal: 20,
                ),
                child: Container(
                  height: 200,
                  decoration: Constants.outerDecorationService(
                      10, Constants.kGreenColor.withOpacity(0.1)),
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10),
                      physics: const ScrollPhysics(),
                      children:
                          List.generate(character.sayings.length, (index) {
                        var creator = character.sayings.elementAt(index);
                        return Text(
                          "\"$creator\"",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText2,
                        );
                      })),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
