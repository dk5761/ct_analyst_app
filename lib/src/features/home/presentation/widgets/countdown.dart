import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import 'timer_buttons.dart';
import 'timer_text_widget.dart';

class CountDown extends StatelessWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 55),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
              color: darkBorderColor, style: BorderStyle.solid, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: TimerTextWidget()),
            Center(
              child: SizedBox(
                height: 20,
              ),
            ),
            Center(child: ButtonsContainer())
          ],
        ),
      ),
    );
  }
}
