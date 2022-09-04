import 'package:dartz/dartz.dart';
import '/domain/entities/app_error.dart';
import '/domain/entities/movie_params.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

class DeleteFavoriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository movieRepository;

  DeleteFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteFavoriteMovie(movieParams.id);
  }
}
