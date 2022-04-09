import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:futurama/futurama/views/home.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'futurama/constants.dart';
import 'futurama/views/character.dart';
import 'futurama/views/quiz.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CharacterPage(),
    QuizPage(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      extendBody: true,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: Container(
        height: 64,
        width: 64,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2)
            ],
          ),
        ),
        child: Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Constants.kPinkColor,
                Constants.kGreenColor,
              ],
            ),
          ),
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child: SvgPicture.asset(
              Constants.kIconMic,
              height: 30,
              // color: Colors.black,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: GlassmorphicContainer(
        width: MediaQuery.of(context).size.width,
        height: 60,
        borderRadius: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kWhiteColor.withOpacity(0.1),
            Constants.kWhiteColor.withOpacity(0.1),
          ],
        ),
        border: 0,
        blur: 30,
        borderGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.kPinkColor,
            Constants.kGreenColor,
          ],
        ),
        child: BottomBar(
          backgroundColor: Colors.transparent,
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: <BottomBarItem>[
            BottomBarItem(
              icon: SvgPicture.asset(
                Constants.kIconHome,
              ),
              activeColor: Constants.kCyanColor,
              title: const Text('Home'),
            ),
            BottomBarItem(
              icon: SvgPicture.asset(
                Constants.kIconPlayOnTv,
              ),
              activeColor: Constants.kCyanColor,
              title: const Text('Characters'),
            ),
            BottomBarItem(
              icon: SvgPicture.asset(
                Constants.kIconCategories,
              ),
              activeColor: Constants.kCyanColor,
              title: const Text('Quiz'),
            ),
            BottomBarItem(
              icon: SvgPicture.asset(
                Constants.kIconDownload,
              ),
              activeColor: Constants.kCyanColor,
              title: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
