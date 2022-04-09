import 'package:flutter/material.dart';
import 'package:futurama/futurama/providers/quiz_service.dart';
import 'package:futurama/futurama/widgets/quiz_tile.dart';
import 'package:provider/provider.dart';

class QuizList extends StatefulWidget {
  const QuizList({Key? key}) : super(key: key);

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  PageController? _pageController;
  bool _isAnswered = false;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  // void nextQuestion() {
  //   if (widget.index != widget.total) {
  //     _isAnswered = false;
  //     _pageController!.nextPage(
  //         duration: const Duration(milliseconds: 250), curve: Curves.ease);
  //   } else {
  //     // Get package provide us simple way to naviigate another page
  //     // Get.to(ScoreScreen());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final quizList = Provider.of<QuizServices>(context);

    return FutureBuilder(
        future: Provider.of<QuizServices>(context).getQuiz(),
        builder: (context, snapshot) {
          if (quizList.quiz.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return PageView.builder(
                // Block swipe to next qn
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                // onPageChanged: updateTheQnNum,
                itemCount: quizList.quiz.length,
                itemBuilder: (context, index) {
                  var _quiz = quizList.quiz.elementAt(index);
                  return QuizTile(
                      quiz: _quiz, index: index, total: quizList.quiz.length);
                });

            // ListView.builder(
            //   physics: const ScrollPhysics(),
            //   padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            //   shrinkWrap: true,
            //   itemCount: quizList.quiz.length,
            //   itemBuilder: (BuildContext context, int index) {
            //     var _quiz = quizList.quiz.elementAt(index);

            //     return QuizTile(
            //         quiz: _quiz, index: index, total: quizList.quiz.length);
            //   },
            // );
          }
        });
  }

  void updateTheQnNum(int i) {
    setState(() {
      // 5 = i;
    });
  }
}
