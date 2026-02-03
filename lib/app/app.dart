import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testcase_1/app/di/di.dart';
import 'package:testcase_1/app/router/app_router.dart';
import 'package:testcase_1/app/theme/app_theme.dart';
import 'package:testcase_1/app/theme/bloc/theme_cubit.dart';
import 'package:testcase_1/app/theme/bloc/theme_state.dart';
import 'package:testcase_1/core/query/query.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return QueryClientProvider(
      client: getIt<QueryClient>(),
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              title: 'Flutter Starter Kit',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeState.themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}
