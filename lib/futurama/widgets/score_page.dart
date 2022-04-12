import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../tab_bar.dart';
import '../constants.dart';
import '../providers/quiz_service.dart';
import 'block_button_widget.dart';

class ScorePage extends StatelessWidget {
  final int total;
  const ScorePage({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizServices>(context, listen: false);
    return Scaffold(
        backgroundColor: Constants.kBlackColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            '🏅 Score Sheet 🏅',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: Constants.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (quizProvider.scores >= 5)
                  Text(
                    '🏆',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Constants.kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(48),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Constants.kGreenColor,
                        Constants.kBlackColor,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("Score",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Constants.kWhiteColor,
                                    fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Consumer<QuizServices>(
                        builder: (context, scores, child) => Text(
                            '${scores.scores} / $total',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: scores.scores < 3
                                        ? Colors.red
                                        : Colors.blue,
                                    fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                if (quizProvider.scores >= 5)
                  Text(
                    '🏆',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Constants.kWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
              ],
            ),
            const SizedBox(
              height: 90,
            ),
            SizedBox(
              width: 200,
              child: Center(
                  child: BlockButtonWidget(
                onPressed: () {
                  quizProvider.reset();
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabBarPage(),
                    ),
                  );
                },
                color: Constants.kGreenColor.withOpacity(0.4),
                text: Text(
                  'Retake Test',
                  style: Theme.of(context).textTheme.headline6!,
                ),
              )),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ));
  }
}
