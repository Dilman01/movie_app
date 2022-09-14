import 'package:flutter/material.dart';
import 'package:movie_app/common/extensions/string_extensions.dart';

import '/presentation/themes/theme_text.dart';
import '/presentation/themes/theme_color.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: 1.h,
            ),
          ),
        ),
        child: Text(
          title.t(context), //'popular','top', 'now', 'soon'
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}
