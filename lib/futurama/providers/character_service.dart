import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/character_model.dart';

class CharacterServices extends ChangeNotifier {
  final _baseUrl = 'https://api.sampleapis.com/futurama/';

  List<Character> _characters = [];
  List<Character> get characters => _characters;

  Future<List<Character>> getCharacters() async {
    var response = await http.get(Uri.parse(
      _baseUrl + 'characters',
    ));
    if (response.statusCode == 200) {
      List data = jsonDecode(utf8.decode(response.bodyBytes));
      List<Character> loadedCharacter = [];

      for (int i = 0; i < data.length; i++) {
        var result = Character.fromJson(data[i]);
        loadedCharacter.add(result);
        _characters = loadedCharacter;
        // print('loadedCharacter $_characters');
      }

      notifyListeners();

      return loadedCharacter;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }
}
