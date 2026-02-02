import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testcase_1/app/app.dart';
import 'package:testcase_1/app/bootstrap/bootstrap.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  await bootstrap();

  // Configure window for desktop platforms
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      // Minimum size
      minimumSize: Size(1024, 920),
      // Initial size
      size: Size(1440, 900),
      // Center window on screen
      center: true,
      // Window title
      title: 'Tally In - WMS',
      // Window background color
      backgroundColor: Colors.transparent,
      // Skip taskbar (set to false to show in taskbar)
      skipTaskbar: false,
      // Title bar style (hidden for custom title bar, normal for default)
      titleBarStyle: TitleBarStyle.normal,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('id')],
      path: 'assets/i18n',
      fallbackLocale: const Locale('en'),
      child: const App(),
    ),
  );
}
