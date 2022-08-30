import 'package:dartz/dartz.dart';
import '/domain/entities/app_error.dart';
import '/domain/entities/movie_detail_entity.dart';
import '/domain/entities/movie_params.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
