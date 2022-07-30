import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_imple.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/repsitories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';

Future<void> main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);

  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  // movieRepository.getTrending();
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>?> eitherResponse =
      await getTrending(NoParams());
  // useing fold to get the value of either left or right
  eitherResponse.fold(
    (l) {
      // if it is an error left will be called
      print('error');
      print(l);
    },
    (r) {
      // if it is success right will be called
      print('list of movies');
      print(r);
    },
  );
  // dataSource.getTrending();
  // dataSource.getPopular();

  // dataSource.getComingSoon();
  // dataSource.getPlayingNow();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
