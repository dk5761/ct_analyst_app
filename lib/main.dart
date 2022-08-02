import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:window_manager/window_manager.dart';
import 'src/app.dart';
import 'src/features/home/domain/timer.dart';
import 'src/features/home/presentation/main_screen/timer.dart';

final timerProvider = StateNotifierProvider<TimerNotifier, TimerModel>(
  (ref) => TimerNotifier(),
);

final _buttonState = Provider<ButtonState>((ref) {
  return ref.watch(timerProvider).buttonState;
});

final buttonProvider = Provider<ButtonState>((ref) {
  return ref.watch(_buttonState);
});

final _timeLeftProvider = Provider<String>((ref) {
  return ref.watch(timerProvider).timeLeft;
});

final timeLeftProvider = Provider<String>((ref) {
  return ref.watch(_timeLeftProvider);
});

// final listOfTaskProvider =
//     Provider((ref) => List<Task>.from(dataoftask.map((x) => Task.fromJson(x))));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  if (Platform.isWindows) {
    await localNotifier.setup(
      appName: 'Daily Task',
      shortcutPolicy: ShortcutPolicy.requireCreate,
    );

    // Must add this line.
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(800, 600),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      // set the window size before rendering it on the screen.
      await windowManager.setMinimumSize(const Size(512, 384));
      await windowManager.setMaximumSize(const Size(1280, 720));

      //set background as transparent
      await windowManager.setBackgroundColor(Colors.transparent);

      // set the prevent close to true
      await windowManager.setPreventClose(true);

      //set resizable
      await windowManager.setResizable(true);

      await windowManager.show();
      await windowManager.focus();
    });
  }

  //AKfycby_Pr0q-x5dM7frWkukAkHoqYXXJlNGvQwmvfpK1pISkd3hbFEz66JFF-ULxVRr4T_B7w
  //https://script.google.com/macros/s/AKfycby_Pr0q-x5dM7frWkukAkHoqYXXJlNGvQwmvfpK1pISkd3hbFEz66JFF-ULxVRr4T_B7w/exec

  runApp(const ProviderScope(child: MyApp()));
}
