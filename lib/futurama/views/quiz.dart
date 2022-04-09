import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/quiz_list.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Constants.kBlackColor,
        appBar: AppBar(
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              '🏆 Quiz 🏆',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Constants.kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(
              color: Constants.kWhiteColor,
              indent: 10,
              endIndent: 10,
            ),
          ]),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Stack(children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreenColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.4,
                right: -88,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kPinkColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kCyanColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const QuizList()
            ])));
  }
}
