import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/get_movie_detail.dart';
import '../cast/cast_cubit.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastCubit castBloc;

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.castBloc,
  }) : super(MovieDetailInitial());

  void loadMovieDetail(int movieId) async {
    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(
      MovieParams(movieId),
    );

    emit(eitherResponse.fold(
      (l) => MovieDetailError(),
      (r) => MovieDetailLoaded(r),
    ));

    castBloc.loadCast(movieId);
  }
}
