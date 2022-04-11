import 'package:flutter/material.dart';
import 'package:futurama/futurama/constants.dart';
import 'package:futurama/futurama/models/quiz_model.dart';
import 'package:futurama/futurama/providers/quiz_service.dart';
import 'package:provider/provider.dart';

import 'block_button_widget.dart';
import 'option.dart';

class QuizTile extends StatefulWidget {
  final Quiz quiz;
  final int index, total;
  final PageController? pageController;
  const QuizTile(
      {Key? key,
      required this.quiz,
      required this.index,
      required this.total,
      required this.pageController})
      : super(key: key);

  @override
  State<QuizTile> createState() => _QuizTileState();
}

class _QuizTileState extends State<QuizTile> {
  List<String> selectedList = [];
  // List<int> totalScore = [];
  // int _numOfCorrectAns = 0;
  int? pageNo;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    pageNo = widget.index + 1;
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizServices>(context, listen: false);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(children: [
          screenHeader(),
          quizQuestion(),
          ...List.generate(widget.quiz.possibleAnswers.length, (index) {
            return Options(
              index: index,
              text: widget.quiz.possibleAnswers[index],
              isSelected: (bool value) {
                setState(() {
                  if (value) {
                    selectedList.remove(widget.quiz.possibleAnswers[index]);
                  } else {
                    selectedList.add(widget.quiz.possibleAnswers[index]);
                  }
                });
              },
            );
          }),
          const SizedBox(
            height: 10,
          ),
          if (pageNo! > 1)
            Consumer<QuizServices>(
              builder: (context, numOfCorrectAns, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (numOfCorrectAns.numOfCorrectAns >= 5)
                    Text(" 🏆 ", style: Theme.of(context).textTheme.headline6),
                  Text(
                    "Score: ${numOfCorrectAns.numOfCorrectAns}/${widget.total}",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: numOfCorrectAns.numOfCorrectAns >= 3
                            ? Colors.blue
                            : Colors.red),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          BlockButtonWidget(
            onPressed: () => selectedList.isEmpty
                ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text(
                      'Kindly select an answer first',
                      style: TextStyle(color: Constants.kWhiteColor),
                    ),
                    backgroundColor: Colors.red.withOpacity(0.7),
                  ))
                : selectedList.length > 1
                    ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                          'Kindly select only one answer',
                          style: TextStyle(color: Constants.kWhiteColor),
                        ),
                        backgroundColor: Colors.red.withOpacity(0.7),
                      ))
                    : quizProvider.nextQuestion(
                        context,
                        selectedList,
                        widget.quiz.correctAnswer,
                        isCorrect,
                        pageNo,
                        widget.total,
                        widget.pageController),
            color: Constants.kGreenColor.withOpacity(0.4),
            text: Text(pageNo != widget.total ? "Next" : "Submit",
                style: Theme.of(context).textTheme.headline6),
          ),
        ]),
      ),
    );
  }

  Widget screenHeader() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Question ${widget.index + 1} of ${widget.total}",
        style: Theme.of(context).textTheme.headline6,
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
