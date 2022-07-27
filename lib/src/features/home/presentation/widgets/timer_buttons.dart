import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';
import '../../../../common/notification.dart';
import '../../../../constants/colors.dart';
import '../../domain/timer.dart';

class ButtonsContainer extends ConsumerWidget {
  const ButtonsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(buttonProvider);

    if (state == ButtonState.finished) {
      notificationHandler().show();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (state == ButtonState.initial) ...[
          const StartButton(),
        ],
        if (state == ButtonState.started) ...[
          const PauseButton(),
        ],
        // if (state == ButtonState.paused) ...[
        //   const StartButton(),
        //   const SizedBox(width: 20),
        //   const ResetButton(),
        // ],
        if (state == ButtonState.finished) ...[
          const ResetButton(),
        ],
      ],
    );
  }
}

class StartButton extends ConsumerWidget {
  const StartButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(darkButtonColor)),
      onPressed: () {
        ref.read(timerProvider.notifier).start();
      },
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class PauseButton extends ConsumerWidget {
  const PauseButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ElevatedButton(
      onPressed: null,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "Shift active",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class ResetButton extends ConsumerWidget {
  const ResetButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(timerProvider.notifier).reset();
      },
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "Reset",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
