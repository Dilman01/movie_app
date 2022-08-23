import 'package:flutter/material.dart';

import '/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import '/presentation/journeys/drawer/navigation_list_item.dart';
import '/presentation/widgets/logo.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: 300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 40.h,
                bottom: 45.h,
                left: 8.w,
                right: 8.w,
              ),
              child: Logo(
                height: 135.h,
              ),
            ),
            NavigationListItem(
              title: 'Favorite Movies',
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: 'Language',
              children: ['English', 'Spanish'],
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
