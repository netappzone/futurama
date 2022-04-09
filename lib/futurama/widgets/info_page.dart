import 'package:flutter/material.dart';
import 'package:futurama/futurama/providers/api.dart';
import 'package:provider/provider.dart';

import 'info_tile.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final infoList = Provider.of<ApiServices>(context);

    return FutureBuilder(
        future: Provider.of<ApiServices>(context).getInfo(),
        builder: (context, snapshot) {
          if (infoList.infos.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return ListView.builder(
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              shrinkWrap: true,
              itemCount: infoList.infos.length,
              itemBuilder: (BuildContext context, int index) {
                var _info = infoList.infos.elementAt(index);

                return InfoTile(info: _info);
              },
            );
          }
        });
  }
}
