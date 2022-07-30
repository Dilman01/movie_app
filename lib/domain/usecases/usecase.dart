import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';

// UseCase class takes 2 generics —
// Type that says what will be the success response type
// and Params that says what are the parameters to make API calls.

abstract class UseCase<Type, Params> {
  // this is generic for any returned object and any type of parameters.
  Future<Either<AppError, Type>> call(Params params);
}
