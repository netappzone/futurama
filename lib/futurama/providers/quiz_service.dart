import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/quiz_model.dart';

class QuizServices extends ChangeNotifier {
  final _baseUrl = 'https://api.sampleapis.com/futurama/';
  List<Quiz> _quiz = [];
  List<Quiz> get quiz => _quiz;

  Future<List<Quiz>> getQuiz() async {
    var response = await http.get(Uri.parse(
      _baseUrl + 'questions',
    ));

    if (response.statusCode == 200) {
      List data = jsonDecode(utf8.decode(response.bodyBytes));
      List<Quiz> loadedInfo = [];

      if (data.isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          var result = Quiz.fromJson(data[i]);

          loadedInfo.add(result);
          _quiz = loadedInfo;
        }
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
