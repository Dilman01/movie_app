import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';

import '../movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  // MovieCarouselBloc({
  //   required this.getTrending,
  // }) : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    CarouselLoadEvent event,
  ) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
        (l) => MovieCarouselError(),
        (movies) {
          movieBackdropBloc
              .add(MovieBackdropChangedEvent(movies![event.defaultIndex]));
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }

  MovieCarouselBloc(
      {required this.getTrending, required this.movieBackdropBloc})
      : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
