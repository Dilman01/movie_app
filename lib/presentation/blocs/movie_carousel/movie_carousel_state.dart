part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

// to be emitted as the first state when the bloc initializes.
class MovieCarouselInitial extends MovieCarouselState {}

// to be emitted if there is an error thrown from API.
class MovieCarouselError extends MovieCarouselState {}

// to be emitted with a list of trending movies and default indexes,
// which is passed from CarouselLoadEvent.
class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    required this.movies,
    this.defaultIndex = 0,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  List<Object> get props => [movies, defaultIndex];
}
