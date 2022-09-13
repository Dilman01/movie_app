import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/theme/theme_cubit.dart';
import '../themes/theme_color.dart';

class Logo extends StatelessWidget {
  final double height;

  Logo({required this.height})
      : assert(height > 0, 'height should be greater than 0');

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: context.read<ThemeCubit>().state == Themes.dark
          ? Colors.white
          : AppColor.vulcan,
      height: height.h,
    );
  }
}
