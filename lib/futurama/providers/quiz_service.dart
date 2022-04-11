import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/quiz_model.dart';
import '../widgets/score_page.dart';

class QuizServices extends ChangeNotifier {
  final _baseUrl = 'https://api.sampleapis.com/futurama/';
  List<Quiz> _quiz = [];
  List<Quiz> get quiz => _quiz;
  int numOfCorrectAns = 0;

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

  void nextQuestion(
    context,
    List<String> selectedList,
    String correctAnswer,
    bool isCorrect,
    int? pageNo,
    int total,
    PageController? pageController,
  ) async {
    if (selectedList.first == correctAnswer) {
      isCorrect = true;
    }
    if (isCorrect == true) numOfCorrectAns++;

    if (pageNo != total) {
      // _isAnswered = false;
      await pageController!.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      await Navigator.push(context,
          MaterialPageRoute(builder: (context) => ScorePage(total: total)));
    }

    notifyListeners();
  }

  void reset() {
    numOfCorrectAns = 0;
    notifyListeners();
  }
}
