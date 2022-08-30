import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

import '../entities/app_error.dart';
import '../entities/movie_detail_entity.dart';

// this class will have mothods to return the -- Future of List of Movies.
abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>?>> getTrending();
  Future<Either<AppError, List<MovieEntity>?>> getPopulr();
  Future<Either<AppError, List<MovieEntity>?>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>?>> getComingSoon();
  Future<Either<AppError, List<MovieEntity>?>> getTopRated();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
}
