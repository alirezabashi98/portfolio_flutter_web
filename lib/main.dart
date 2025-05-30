import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/core/di/service_locator.dart';
import 'package:portfolio/feature/home/persientation/home_screen.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/share/locale_cubit.dart';
import 'package:portfolio/share/theme_cubit.dart';
import 'package:portfolio/style/app_theme.dart';

Future<void> main() async {
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit(getIt())..init()),
        BlocProvider(create: (context) => ThemeCubit(getIt())..init()),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, Locate) {
          return BlocBuilder<ThemeCubit, bool>(
            builder: (context, isDark) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: [Locale('en'), Locale('fa')],
                locale: Locale(Locate),
                darkTheme: AppTheme(fontFamily: _fontFamily(Locate)).dark,
                theme: AppTheme(fontFamily: _fontFamily(Locate)).light,
                themeMode: _isDrkeTheme(isDark),
                home: HomeScreen(),
              );
            },
          );
        },
      ),
    );
  }

  _fontFamily(String locale) => locale == 'en' ? 'poppins' : 'vazir';

  _isDrkeTheme(bool isDark) => isDark ? ThemeMode.dark : ThemeMode.light;
}
