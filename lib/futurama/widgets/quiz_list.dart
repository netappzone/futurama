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
  int currentPagePosition = 0;

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
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (position) {
                  currentPagePosition = position;
                },
                itemCount: quizList.quiz.length,
                itemBuilder: (context, index) {
                  var _quiz = quizList.quiz.elementAt(index);

                  return QuizTile(
                      quiz: _quiz,
                      index: index,
                      total: quizList.quiz.length,
                      pageController: _pageController);
                });
          }
        });
  }
}
