import 'package:flutter/material.dart';
import 'package:futurama/futurama/models/quiz_model.dart';

import 'option.dart';

class QuizTile extends StatefulWidget {
  final Quiz quiz;
  final int index, total;
  const QuizTile(
      {Key? key, required this.quiz, required this.index, required this.total})
      : super(key: key);

  @override
  State<QuizTile> createState() => _QuizTileState();
}

class _QuizTileState extends State<QuizTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(children: [
        screenHeader(),
        quizQuestion(),
        ...List.generate(
          widget.quiz.possibleAnswers.length,
          (index) => Options(
              index: index,
              text: widget.quiz.possibleAnswers[index],
              press: () => {} //_controller.checkAns(question, index),
              ),
        ),
      ]),
    );
  }

  Widget screenHeader() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Question ${widget.index + 1} of ${widget.total}",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget quizQuestion() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        widget.quiz.question,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
