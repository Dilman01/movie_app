import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repsitories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

import '../entities/no_params.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>?, NoParams> {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>?>> call(NoParams noParams) async {
    return await repository.getPlayingNow();
  }
}