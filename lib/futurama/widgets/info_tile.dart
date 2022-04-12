import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/info_model.dart';
import 'creatortile.dart';

class InfoTile extends StatelessWidget {
  final Info info;
  const InfoTile({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Text(
          'Years Aired',
          style: TextStyle(
            color: Constants.kWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          info.yearsAired,
          // textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 17,
            color: Constants.kWhiteColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
              'Creators: ',
              style: TextStyle(
                color: Constants.kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Click to go to the creator's IMDB page",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontStyle: FontStyle.italic)),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: info.creators.map((opt) {
                return CreatorTile(creator: opt);
              }).toList(),
            )),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Info',
          style: TextStyle(
            color: Constants.kWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          info.synopsis,
          // textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 17,
            color: Constants.kWhiteColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
