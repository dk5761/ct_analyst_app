import 'dart:io';
import 'package:ct_analyst_app/src/constants/app_breakpoints.dart';
import 'package:ct_analyst_app/src/features/home/presentation/main_screen/main_screen.dart';
import 'package:ct_analyst_app/src/features/home/presentation/sidepanel/side_panel_screen.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart' hide MenuItem;

import '../../../common/split_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener, TrayListener {
  @override
  void initState() {
    trayManager.addListener(this);
    windowManager.addListener(this);
    _init();

    super.initState();
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    windowManager.removeListener(this);
    super.dispose();
  }

  void _init() async {
    await trayManager.setIcon(
      Platform.isWindows
          ? 'assets/images/tray_icon.ico'
          : 'assets/images/tray_icon.ico',
    );
    Menu menu = Menu(
      items: [
        MenuItem(
          key: 'show_window',
          label: 'Show Window',
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'exit_app',
          label: 'Exit App',
        ),
      ],
    );
    await trayManager.setContextMenu(menu);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kWindowCaptionHeight),
                child: WindowCaption(
                  brightness: Theme.of(context).brightness,
                  title: const Text('Daily Task'),
                ),
              ),
              body: const SplitView(
                content: MainScreen(),
                menu: SidePanel(),
                breakpoint: Breakpoint.breakpointMobile,
                menuWidth: 3,
              )),
        ),
      ],
    );
  }

  @override
  void onTrayIconMouseDown() {
    windowManager.show();
  }

  @override
  void onTrayIconRightMouseDown() {
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) async {
    switch (menuItem.key) {
      case 'show_window':
        await windowManager.focus();
        break;
    }
  }

  @override
  void onWindowFocus() {
    setState(() {});
  }

  @override
  void onWindowClose() {
    // print("this is inside close");
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Are you sure you want to close this window?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                windowManager.destroy();
              },
            ),
          ],
        );
      },
    );
  }

  // @override
  // void onWindowEvent(String eventName) {
  //   print('[WindowManager] onWindowEvent: $eventName');
  // }
}
