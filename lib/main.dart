import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';

import 'di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  unawaited(getIt.init());

  runApp(MovieApp());
  // unawaited(getIt.init());
  // // movieRepository.getTrending();
  // GetTrending getTrending = getIt.getItInstanse<GetTrending>();
  // final Either<AppError, List<MovieEntity>?> eitherResponse =
  //     await getTrending(NoParams());
  // // useing fold to get the value of either left or right
  // eitherResponse.fold(
  //   (l) {
  //     // if it is an error left will be called
  //     print('error');
  //     print(l);
  //   },
  //   (r) {
  //     // if it is success right will be called
  //     print('list of movies');
  //     print(r);
  //   },
  // );
  // // dataSource.getTrending();
  // // dataSource.getPopular();

  // // dataSource.getComingSoon();
  // // dataSource.getPlayingNow();
  // runApp(const MyApp());
}
