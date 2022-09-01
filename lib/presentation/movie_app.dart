import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/di/get_it.dart';

import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';
import 'package:movie_app/presentation/wiredash_app.dart';
import 'package:wiredash/wiredash.dart';

import 'app_localizations.dart';
import 'blocs/language/language_cubit.dart';
import 'journeys/home/home_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  // late final _navigatorKey = GlobalKey<NavigatorState>();
  late LanguageCubit _languageCubit;

  @override
  void initState() {
    _languageCubit = getItInstance<LanguageCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _languageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => BlocProvider<LanguageCubit>.value(
        value: _languageCubit,
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            // if (locale is LanguageLoaded) {
            return WiredashApp(
              // navigatorKey: _navigatorKey,
              languageCode: locale.languageCode,
              child: MaterialApp(
                // navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  primaryColor: AppColor.vulcan,
                  accentColor: AppColor.royalBlue,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(
                      elevation: 0, backgroundColor: AppColor.vulcan),
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: Theme.of(context).textTheme.greySubtitle1,
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: HomeScreen(),
              ),
            );
            // }

            // return const SizedBox.shrink();
          },
        ),
      ),
      designSize: const Size(414, 896),
    );
  }
}
