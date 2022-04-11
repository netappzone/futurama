import 'package:flutter/material.dart';
import 'package:futurama/futurama/constants.dart';

class Options extends StatefulWidget {
  final String text;
  // final Quiz quiz;
  final int index;
  // selectedPosition;
  // final VoidCallback press;
  // final bool isAnswered;
  final ValueChanged<bool> isSelected;

  const Options({
    Key? key,
    required this.text,
    required this.index,
    // required this.selectedPosition,
    // required this.quiz,
    // required this.press,
    required this.isSelected,
    // required this.isAnswered,
  }) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelected(isSelected);
          isSelected = !isSelected;
        });
      },

      // checkAns(widget.quiz, widget.text, widget.selectedPosition),
      // {()
      //   print(widget.selectedPosition);
      //   widget.press;
      // },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Constants.kGreenColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.index + 1}. ${widget.text}",
              style:
                  const TextStyle(color: Constants.kWhiteColor, fontSize: 16),
            ),
            Icon(
                isSelected ? Icons.check_circle_outline : Icons.circle_outlined,
                size: 20),
          ],
        ),
      ),
    );
  }
}
