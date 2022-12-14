import 'package:dartz/dartz.dart';
import '/domain/entities/app_error.dart';
import '/domain/entities/movie_entity.dart';
import '/domain/entities/no_params.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getFavoriteMovies();
  }
}
