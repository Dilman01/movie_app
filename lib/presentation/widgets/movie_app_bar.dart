import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movie_app/presentation/widgets/logo.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/search_movie/search_movie_cubit.dart';
import '../blocs/theme/theme_cubit.dart';
import '../journeys/search_movie/custom_search_movie_delegate.dart';
import '../themes/theme_color.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50.h,
        left: 16.w,
        right: 16.w,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: 32.h,
              color: context.read<ThemeCubit>().state == Themes.dark
                  ? Colors.white
                  : AppColor.vulcan,
            ),
          ),
          Expanded(
            child: Logo(
              height: 34.h,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(
                  BlocProvider.of<SearchMovieCubit>(context),
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: context.read<ThemeCubit>().state == Themes.dark
                  ? Colors.white
                  : AppColor.vulcan,
              size: 32.h,
            ),
          ),
        ],
      ),
    );
  }
}
