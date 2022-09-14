import 'package:dartz/dartz.dart';
import '/domain/entities/app_error.dart';
import '/domain/entities/movie_params.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

class CheckIfFavoriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieFavorite(movieParams.id);
  }
}
