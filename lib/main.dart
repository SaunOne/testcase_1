import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:testcase_1/app/app.dart';
import 'package:testcase_1/app/bootstrap/bootstrap.dart';

void main() async {
  await bootstrap();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('id')],
      path: 'assets/i18n',
      fallbackLocale: const Locale('en'),
      child: const App(),
    ),
  );
}
