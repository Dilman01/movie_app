import 'package:flutter/material.dart';

import 'package:movie_app/presentation/themes/theme_color.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

import 'journeys/home/home_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primaryColor: AppColor.vulcan,
          accentColor: AppColor.royalBlue,
          scaffoldBackgroundColor: AppColor.vulcan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        home: HomeScreen(),
      ),
      designSize: const Size(414, 896),
    );
  }
}
