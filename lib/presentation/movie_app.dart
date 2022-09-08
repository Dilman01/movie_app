import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/routes.dart';

import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';
import 'package:movie_app/presentation/wiredash_app.dart';

import '../common/constants/route_constants.dart';
import 'app_localizations.dart';
import 'blocs/language/language_cubit.dart';
import 'blocs/loading/loading_cubit.dart';
import 'fade_page_route_builder.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'journeys/loading/loading_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageCubit _languageCubit;
  late LoadingCubit _loadingCubit;

  @override
  void initState() {
    _languageCubit = getItInstance<LanguageCubit>();
    _languageCubit.loadPreferredLanguage();
    _loadingCubit = getItInstance<LoadingCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _languageCubit.close();
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<LanguageCubit>.value(value: _languageCubit),
          BlocProvider<LoadingCubit>.value(value: _loadingCubit),
        ],
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            return WiredashApp(
              languageCode: locale.languageCode,
              child: MaterialApp(
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
                builder: (context, child) {
                  return LoadingScreen(
                    screen: child!,
                  );
                },
                initialRoute: RouteList.initial,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder? builder = routes[settings.name];
                  return FadePageRouteBuilder(
                    builder: builder!,
                    settings: settings,
                  );
                },
              ),
            );
          },
        ),
      ),
      designSize: const Size(414, 896),
    );
  }
}
