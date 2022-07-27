import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../main.dart';

class TimerTextWidget extends ConsumerWidget {
  const TimerTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeLeft = ref.watch(timeLeftProvider);
    return Text(
      timeLeft,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
