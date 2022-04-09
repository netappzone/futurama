import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/info_model.dart';

class ApiServices extends ChangeNotifier {
  final _baseUrl = 'https://api.sampleapis.com/futurama/';
  List<Info> _infos = [];
  List<Info> get infos => _infos;

  Future<List<Info>> getInfo() async {
    var response = await http.get(Uri.parse(
      _baseUrl + 'info',
    ));
    if (response.statusCode == 200) {
      List data = jsonDecode(utf8.decode(response.bodyBytes));
      List<Info> loadedInfo = [];

      for (int i = 0; i < data.length; i++) {
        var result = Info.fromJson(data[i]);

        loadedInfo.add(result);
        _infos = loadedInfo;
      }

      notifyListeners();
      return loadedInfo;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
