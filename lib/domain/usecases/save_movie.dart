import '/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import '/domain/entities/movie_entity.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await movieRepository.saveMovie(params);
  }
}
