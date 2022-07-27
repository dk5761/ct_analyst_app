import 'package:ct_analyst_app/src/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/theme_provider.dart';
import 'utils/scroll_behavior.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Daily Task',
      theme: ref.watch(theme),
      darkTheme: ref.watch(darkTheme),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
