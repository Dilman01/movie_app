import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';

// Defining the type that GetTrending will return
// and parameters that it takes (if any)
class GetTrending extends UseCase<List<MovieEntity>?, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  // The call method is already present in all dart objects.
  // So, creating a method with a call name,
  // allows you to call this method just with the instance of the class.

  // this call method takes NoParams because this API call doesn't need any parameters
  @override
  Future<Either<AppError, List<MovieEntity>?>> call(NoParams noParams) async {
    return await repository.getTrending(); // this return the list of movies
  }
}
