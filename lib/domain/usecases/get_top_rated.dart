import 'package:dartz/dartz.dart';
import '/domain/entities/app_error.dart';
import '/domain/entities/movie_entity.dart';
import '../repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

import '../entities/no_params.dart';

class GetTopRated extends UseCase<List<MovieEntity>?, NoParams> {
  final MovieRepository repository;

  GetTopRated(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>?>> call(NoParams noParams) async {
    return await repository.getTopRated();
  }
}
