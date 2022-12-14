import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';

import '../../../../common/constants/route_constants.dart';
import '../../../../data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  MovieCardWidget({required this.movieId, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(16.w),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            RouteList.movieDetail,
            arguments: MovieDetailArguments(movieId),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
