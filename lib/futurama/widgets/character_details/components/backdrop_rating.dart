import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/character_model.dart';

class BackDropAndRating extends StatelessWidget {
  const BackDropAndRating(
      {Key? key, required this.size, required this.character})
      : super(key: key);

  final Size size;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        //40% of our total heigth
        height: size.height * 0.4,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.4 - 50,
              decoration: BoxDecoration(
                color: Constants.kGreenColor.withOpacity(0.2),
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(50)),
                image: DecorationImage(
                  image: NetworkImage(character.images.main),
                ),
              ),
            ),
            //Rating Box
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 80,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  color: Constants.kWhiteColor.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 5,
                      color: Constants.kGreenColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'AGE\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' ${character.age}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'GENDER\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '  ${character.gender}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'SPECIE\n',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Constants.kBlackColor,
                                ),
                              ),
                              TextSpan(
                                text: ' ${character.species}',
                                style: const TextStyle(
                                  color: Constants.kBlackColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Back Button
            SafeArea(
              child: IconButton(
                iconSize: size.width * 0.070,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios,
                    color: Constants.kWhiteColor.withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
