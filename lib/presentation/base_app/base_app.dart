import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hatching/domain/app_bloc/app_bloc.dart';
import 'package:hatching/presentation/main_screen/main_screen.dart';
import 'package:hatching/utils/resourses.dart';
import 'package:hatching/utils/themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _initBlocs(),
      child: EasyLocalization(
        supportedLocales: const [
          ProjectLocales.enLocale,
          ProjectLocales.uaLocale
        ],
        path: 'assets/translations',
        useOnlyLangCode: true,
        fallbackLocale: ProjectLocales.enLocale,
        startLocale: ProjectLocales.enLocale,
        child: const BaseApp(),
      ),
    );
  }

  List<BlocProvider> _initBlocs() {
    return [
      BlocProvider(create: (_) => AppBloc()),
    ];
  }
}

class BaseApp extends StatelessWidget {
  const BaseApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hatching',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        EasyLocalization.of(context)!.delegate,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.system,
      theme: AppThemes.getLightTheme(context),
      darkTheme: AppThemes.getDarkTheme(context),
      home: const MainScreen(),
    );
  }
}
