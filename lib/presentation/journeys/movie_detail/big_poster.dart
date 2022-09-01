import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/extensions/num_extensions.dart';

import '/presentation/journeys/movie_detail/movie_detail_app_bar.dart';
import '/presentation/themes/theme_text.dart';
import '/data/core/api_constants.dart';
import '/domain/entities/movie_detail_entity.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // padding: EdgeInsets.all(20),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate!,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAverage!.convertToPercentageString(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          left: 16.w,
          right: 16.w,
          top: 45.h,
          child: MovieDetailAppBar(),
        ),
      ],
    );
  }
}
