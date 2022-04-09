import 'dart:async';

import 'package:flutter/material.dart';
import 'package:futurama/futurama/models/creator_model.dart';
import 'package:futurama/futurama/widgets/webview.dart';
import '../constants.dart';

class CreatorTile extends StatefulWidget {
  final Creator creator;
  const CreatorTile({Key? key, required this.creator}) : super(key: key);

  @override
  State<CreatorTile> createState() => _CreatorTileState();
}

class _CreatorTileState extends State<CreatorTile> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => isLoading = true);
        Timer(const Duration(seconds: 2), () {});
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewPage(creator: widget.creator)));
        setState(() => isLoading = false);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.8,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        decoration: Constants.outerDecorationService(
            10, Constants.kGreenColor.withOpacity(0.1)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 10),
          isLoading == true
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  widget.creator.name,
                  style: Theme.of(context).textTheme.subtitle1!.merge(
                      const TextStyle(
                          color: Constants.kWhiteColor,
                          fontWeight: FontWeight.bold)),
                ),
          const SizedBox(height: 5),
        ]),
      ),
    );
  }
}
