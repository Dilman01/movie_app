part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropState extends Equatable {
  const MovieBackdropState();

  @override
  List<Object> get props => [];
}

// this will be the initial state
class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackdropChanged extends MovieBackdropState {
  final MovieEntity movie;

  const MovieBackdropChanged(this.movie);

  @override
  List<Object> get props => [movie];
}
